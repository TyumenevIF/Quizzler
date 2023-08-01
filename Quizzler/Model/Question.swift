//
//  Question.swift
//  Quizzler
//
//  Created by Ilyas Tyumenev on 13.04.2023.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer        
    }
}
