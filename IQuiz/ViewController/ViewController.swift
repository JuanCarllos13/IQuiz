//
//  ViewController.swift
//  IQuiz
//
//  Created by Juan Carlos on 21/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout(){
        BotaoIncialQuiz.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
    }

    @IBAction func botaoPresseionado(_ sender: Any) {
        print("O botão foi presionando!")
    }
    
    @IBOutlet weak var BotaoIncialQuiz: UIButton!
}

