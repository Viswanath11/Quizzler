//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let questionListOnLabel: QuestionBank = QuestionBank()
	var chosenAnswer: Bool = false
	var questionNumber: Int = -1
	var score: Int = 0
	
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		nextQuestion()
		
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
		if (sender.tag == 0){chosenAnswer = false}
		else if (sender.tag == 1){chosenAnswer = true}
		
		checkAnswer()
		updateUI()
		nextQuestion()
    }
    
    
    func updateUI() {
		scoreLabel.text = "Your Score: " + String(score)
		if questionNumber<12{
		progressLabel.text = "\(questionNumber + 2) / 13"
		progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 2)
		}
    }
    

    func nextQuestion() {
		
		questionNumber += 1
		
		if questionNumber < 13 {
			questionLabel.text = questionListOnLabel.listOfQuestions[questionNumber].question
		}else{
			
			let alert = UIAlertController(title: "Horray!", message: "End of Quiz. Do you want to start again?", preferredStyle: .alert)
			let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (aUIAlertAction) in
				self.startOver()
			})
			alert.addAction(restartAction)
			present(alert, animated: false, completion: nil)
			
		}
		
    }
    
    
    func checkAnswer() {
		if chosenAnswer ==
			questionListOnLabel.listOfQuestions[questionNumber].answer{
			print("Correct!")
			ProgressHUD.showSuccess("You're Right!")
			score += 1
		} else {
			print("INcorrect!")
			ProgressHUD.showError("Oops!, Wrong.")
		}
		
    }
    
    
    func startOver() {
		questionNumber = -1
		score = 0
		updateUI()
		nextQuestion()
    }
    

    
}
