//
//  QuestionMultiple.swift
//  Quizzler-iOS13
//
//  Created by Luiz Doreto on 11/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuestionMultiple {
    let text: String
    let options: [String]
    let correctAnswer: String
    
    init(q: String, o: [String], c: String) {
        text = q
        options = o
        correctAnswer = c
    }
}
