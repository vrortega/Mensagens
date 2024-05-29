//
//  ScreenColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var whiteBorderSw: UISwitch!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLb.text = message.text
        messageLb.textColor = message.textColor
        messageLb.backgroundColor = message.backgroundColor
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultViewController
        vc.message = message
        vc.useWhiteBorder = whiteBorderSw.isOn
    }
    
    // chama o colorpicker para o usuário alterar a cor da mensagem na tela
    override func changeColor(_ sender: UIButton) {
       let colorPicker = storyboard?.instantiateViewController(identifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.reference = self
            present(colorPicker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // troca a cor da borda pra branco se o switch estiver on
    @IBAction func changeBorder(_ sender: UISwitch) {
        viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
}

extension ScreenColorViewController: ColorPickerProtocol {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}
