//
//  ViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {
    
    @IBOutlet var messageTextField: UITextField!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate = self
        //instancia a struct message
       message = Message()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MessageColorViewController
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

extension MessageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        message.text = textField.text!
        messageLb.text = textField.text!
        
        return true
    }
}

extension MessageViewController: ColorPickerProtocol {
    func applyColor(color: UIColor){
        messageLb.textColor = color
        message.textColor = color
    }
}
