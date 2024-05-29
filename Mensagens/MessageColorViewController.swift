//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLb.text = message.text
        messageLb.textColor = message.textColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }
    
    // chama o colorpicker para o usuário alterar a cor da mensagem na tela
    override func changeColor(_ sender: UIButton) {
       let colorPicker = storyboard?.instantiateViewController(identifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.reference = self
            present(colorPicker, animated: true, completion: nil)
    }
    
}

extension MessageColorViewController: ColorPickerProtocol {
    func applyColor(color: UIColor){
        messageLb.backgroundColor = color
        message.backgroundColor = color
    }
}
