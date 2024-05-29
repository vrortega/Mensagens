//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Vitoria Ortega on 28/05/24.
//  Copyright © 2024 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var messageLb: UILabel!
    var message: Message!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeColor(_ sender: UIButton){
        
    }
    
}
