//
//  ResultViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {

    @IBOutlet weak var viBorder: UIView!
    var useWhiteBorder: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        messageLb.text = message.text
        messageLb.textColor = message.textColor
        messageLb.backgroundColor = message.backgroundColor
        view.backgroundColor = message.screenColor
        viBorder.backgroundColor = useWhiteBorder ? .white : .clear
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.popViewController(animated: true)
    }
}
