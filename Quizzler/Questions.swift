//
//  Questions.swift
//  Quizzler
//
//  Created by Viswanath Subramani S S on 03/11/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
	
	let question: String
	let answer: Bool
	
	init(question: String, answer: Bool) {
		self.question = question
		self.answer = answer
	}
}
