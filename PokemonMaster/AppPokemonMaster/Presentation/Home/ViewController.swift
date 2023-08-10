//
//  ViewController.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 20/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func open(_ sender: Any) {
        let vc = PokemonDetailViewController.create(with: PokemonDetailViewModel())
        
        // Establecer el punto fijo alrededor del cual se realizará la escala
        let anchorPoint = CGPoint(x: 0.70, y: 0.5) // Por ejemplo, el centro de la vista

        // Obtener el tamaño original de la vista
        let originalSize = view.bounds.size

        // Calcular el desplazamiento necesario para mantener el punto fijo durante la escala
        let anchorOffset = CGPoint(x: anchorPoint.x * originalSize.width,
                                   y: anchorPoint.y * originalSize.height)

        vc.view.layer.anchorPoint = anchorPoint
        vc.view.layer.position = CGPoint(x: vc.view.layer.position.x - anchorOffset.x,
                                         y: vc.view.layer.position.y - anchorOffset.y)
        vc.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) // Escala de ejemplo (50%)
        
        // Aplicar la transformación de escala
        UIView.animate(withDuration: 0.3) {
            vc.view.transform = .identity
        }
        UIView.transition(with: navigationController!.view, duration: 0.0, options: .transitionFlipFromLeft, animations: nil, completion: nil) // Aplica una transición de fundido
        navigationController?.setNavigationBarHidden(false, animated: false) // Muestra nuevamente la barra de navegación
        navigationController?.pushViewController(vc, animated: true)

    }
    
}
