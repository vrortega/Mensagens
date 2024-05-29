//
//  ColorPickerViewController.swift
//  Mensagens
//
//  Created by Vitoria Ortega on 28/05/24.
//  Copyright © 2024 Eric Brito. All rights reserved.
//

import UIKit

// protocolo que obriga o uso do método applyColor()
protocol ColorPickerProtocol: class {
    func applyColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorVw: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    weak var reference: ColorPickerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        reference?.applyColor(color: colorVw.backgroundColor!)
     }
    
    // Método que troca a cor da view conforme escolha do usuário
    @IBAction func changeColor(_ sender: UISlider) {
    colorVw.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
}
