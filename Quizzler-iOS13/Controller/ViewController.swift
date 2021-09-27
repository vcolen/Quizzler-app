//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    var quizBrain = QuizBrain()
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        let defaultBackgroundColor = answer1Button.backgroundColor
        let defaultTextColor = answer1Button.titleColor(for: .normal)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            sender.setTitleColor(.white, for: .normal)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [self] timer in
            updateQuestion()
            answer1Button.backgroundColor = defaultBackgroundColor
            answer2Button.backgroundColor = defaultBackgroundColor
            answer3Button.backgroundColor = defaultBackgroundColor
            
            answer1Button.setTitleColor(defaultTextColor, for: .normal)
            answer2Button.setTitleColor(defaultTextColor, for: .normal)
            answer3Button.setTitleColor(defaultTextColor, for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.quiz[0].text
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        answer1Button.setTitle(quizBrain.quiz[0].answer[0], for: .normal)
        answer2Button.setTitle(quizBrain.quiz[0].answer[1], for: .normal)
        answer3Button.setTitle(quizBrain.quiz[0].answer[2], for: .normal)
    }
    
    func updateQuestion() {
        questionLabel.text = quizBrain.getQuestionText()
        answer1Button.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[0], for: .normal)
        answer2Button.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[1], for: .normal)
        answer3Button.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    
}

