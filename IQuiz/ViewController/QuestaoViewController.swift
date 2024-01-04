//
//  QuestaoViewController.swift
//  IQuiz
//
//  Created by Juan Carlos on 21/12/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var TituloQuestaoLabel: UILabel!
    @IBOutlet var botoesResponstas: [UIButton]!
    
    @IBAction func responseBotaoPressionado(_ sender: UIButton) {
        print(sender.tag)
        let usuarioAcertouResposta = questoes[numeroQuestao].responstaCorreta == sender.tag
        
        if(usuarioAcertouResposta){
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
            print("o Usuário acertou")
        }else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            let _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuesatao), userInfo: nil, repeats: false)
            
        } else {
            navegaParaTelaDesempenho()
        }
   
        
    }
    
    func navegaParaTelaDesempenho(){
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        configurarLayout()
        configurarQuesatao()
    }
    
    func configurarLayout() {
          navigationItem.hidesBackButton = true
        TituloQuestaoLabel.numberOfLines = 0
        TituloQuestaoLabel.textAlignment = .center
          for botao in botoesResponstas {
              botao.layer.cornerRadius = 12.0
          }
      }
    
    
    @objc func configurarQuesatao(){
        TituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        
        for botao in botoesResponstas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {return}
        desempenhoVC.pontuacao = pontuacao
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
