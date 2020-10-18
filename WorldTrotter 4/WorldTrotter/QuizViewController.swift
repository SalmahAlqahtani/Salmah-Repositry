//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Salmah  on 27/02/1442 AH.
//

import UIKit
import UIKit

class QuizViewController: UIViewController {
    
    var currentQuestionIndex : Int = 0

    
    

    @IBOutlet var questionLable: UILabel!
    
    
    @IBOutlet var answerLable: UILabel!
    
    
    let questions : [String] = ["What is 7+7 ?" , "What is the capital of KSA ?" , "What is juice made from ? "]
    let answers = ["14" , "Riyadh" , "Fruites or vegitables"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLable.text = questions[currentQuestionIndex]
    }

    
    @IBAction func showNextQuestionTapped(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLable.text = question
        answerLable.text = "????"
       
        
    }
    
    @IBAction func showAnswerTapped(_ sender: UIButton) {
        
        let answer : String = answers[currentQuestionIndex]
        answerLable.text = answer
        
    }
    

    
    
}
