//
//  MultipleQuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Luiz Doreto on 11/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct MultipleQuizBrain {
    let quiz = [
        QuestionMultiple(q: "Which is the largest organ in the human body?", o: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        QuestionMultiple(q: "Five dollars is worth how many nickels?", o: ["25", "50", "100"], c: "100"),
        QuestionMultiple(q: "What do the letters in the GMT time zone stand for?", o: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        QuestionMultiple(q: "What is the French word for 'hat'?", o: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        QuestionMultiple(q: "In past times, what would a gentleman keep in his fob pocket?", o: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        QuestionMultiple(q: "How would one say goodbye in Spanish?", o: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        QuestionMultiple(q: "Which of these colours is NOT featured in the logo for Google?", o: ["Green", "Orange", "Blue"], c: "Orange"),
        QuestionMultiple(q: "What alcoholic drink is made from molasses?", o: ["Rum", "Whisky", "Gin"], c: "Rum"),
        QuestionMultiple(q: "What type of animal was Harambe?", o: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        QuestionMultiple(q: "Where is Tasmania located?", o: ["Indonesia", "Australia", "Scotland"], c: "Australia")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestion() -> QuestionMultiple {
        return quiz[questionNumber]
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
}
