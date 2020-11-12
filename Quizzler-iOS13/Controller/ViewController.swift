//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var optionAButton: UIButton!
    @IBOutlet var optionBButton: UIButton!
    @IBOutlet var optionCButton: UIButton!
    
//    var quizBrain = QuizBrain()
    var quizBrain = MultipleQuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answerRight = quizBrain.checkAnswer(userAnswer)
        
        if answerRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let question = quizBrain.getQuestion()
        // question
        questionLabel.text = question.text
        
        //options
        optionAButton.setTitle(question.options[0], for: .normal)
        optionBButton.setTitle(question.options[1], for: .normal)
        optionCButton.setTitle(question.options[2], for: .normal)
        
        // progress and score
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // reset button color
        optionAButton.backgroundColor = UIColor.clear
        optionBButton.backgroundColor = UIColor.clear
        optionCButton.backgroundColor = UIColor.clear
    }
    
}

