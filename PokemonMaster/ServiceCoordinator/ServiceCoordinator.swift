//
//  ServiceCoordinator.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 22/06/23.
//
import UIKit

typealias Response<T> = (ServiceStatus<T>) -> Void

public final class ServiceCoordinator {

    static func sendRequest<T: Codable>(url urlString: String, parameters params: [String: Any]? = nil, httpMethod: HTTPType = .get, headerFields: [String: String]? = nil, body: [String: Any]? = nil, cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData, completion: @escaping Response<T>) {

        guard let url = getURL(url: urlString, parameters: params) else {
            completion(.failed(error: .urlInvalid))
            return
        }

        var request = URLRequest(url: url)

        request.httpMethod = httpMethod.rawValue
        request.cachePolicy = cachePolicy

        if let headerFields = headerFields {
            request.allHTTPHeaderFields = headerFields
        }

        if let body = body, httpMethod != HTTPType.get, let jsonData = codingBody(body: body) {
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            DispatchQueue.main.async {

                if let error = error {
                    completion(.unowned(error: error.localizedDescription))
                    return
                }

                if let response = response, let httpResponse = response as? HTTPURLResponse {

                    switch httpResponse.statusCode {

                    case 100..<200:
                        completion(.unowned(error: "Se respondio solo con informacion"))

                    case 200..<300:

                        if let data = data, !data.isEmpty {

                            if let dataD: T = data as? T {
                                completion(.success(data: dataD))
                            } else if let dataD: T = decodingRequest(data: data) {
                                completion(.success(data: dataD))
                            } else {
                                completion(.failed(error: .codingError))
                            }

                        } else {
                            completion(.failed(error: .emptyRequest))
                        }

                    case 300..<400:
                        completion(.unowned(error: "Se quiere redireccionar al usuario a una nueva url"))

                    case 400..<500:
                        completion(.failed(error: .clientError))

                    case 500..<600:
                        completion(.failed(error: .serverError))

                    default:
                        completion(.unowned(error: "Codigo desconocido \(httpResponse.statusCode)"))
                    }
                }
            }
        }

        task.resume()

    }

    static func getURL(url urlString: String, parameters params: [String: Any]?) -> URL? {

        guard let url = URL(string: urlString) else { return nil }

        var urlComponets = URLComponents(url: url, resolvingAgainstBaseURL: true)

        if let params = params {

            var queryItems: [URLQueryItem] = []

            params.forEach { (key: String, value: Any) in
                let valueString = String(describing: value)
                queryItems.append(URLQueryItem(name: key, value: valueString))
            }

            urlComponets?.queryItems = queryItems

            return urlComponets?.url

        }
        return urlComponets?.url
    }

    static func codingBody(body: [String: Any]) -> Data? {
        if JSONSerialization.isValidJSONObject(body) {
            return try? JSONSerialization.data(withJSONObject: body)
        }
        return nil
    }

    static func decodingRequest<T: Codable>(data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
