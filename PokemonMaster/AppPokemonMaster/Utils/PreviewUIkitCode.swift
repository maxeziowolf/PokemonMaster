//
//  PreviewUIkitCode.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 12/07/23.
//

import SwiftUI

 struct ViewControllerPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    var viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }

    func makeUIViewController(context: Context) -> UIViewController {
        viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // nada aqui
    }

 }

 struct ViewPreview: UIViewRepresentable {
    typealias UIViewType = UIView
    var viewBuilder: () -> UIView

    init(viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> UIView {
        viewBuilder()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Notin
    }

 }
