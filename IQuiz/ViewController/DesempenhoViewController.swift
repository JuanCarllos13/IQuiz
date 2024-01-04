//
//  DesempenhoViewController.swift
//  IQuiz
//
//  Created by Juan Carlos on 26/12/23.
//

import UIKit

class DesempenhoViewController: UIViewController {
    
    var pontuacao: Int?

    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBOutlet weak var percentualLabel: UILabel!
    
    @IBOutlet weak var botaoReinicarQuiz: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarDensempenho()

        // Do any additional setup after loading the view.
    }
    
    func configurarLayout(){
        botaoReinicarQuiz.layer.cornerRadius = 12
        navigationItem.hidesBackButton = true
    }
    
    func configurarDensempenho(){
        guard let pontuacao = pontuacao else {return}
        resultadoLabel.text = "Você acertou \(pontuacao) de \(questoes.count) questões"
        
        let percentual = (pontuacao * 100) / questoes.count
        percentualLabel.text = "Percentual final: \(percentual)%"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
