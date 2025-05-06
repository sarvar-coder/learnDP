//
//  BaseQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 06/05/25.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    
    
    //    MARK: - Properties
    public var correctCount: Int {
        get { questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue}
    }
    public var incorrectCount: Int {
        get { questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    private var questionGroupCareTaker: QuestionGroupCaretaker
    
    var questionGroup: QuestionGroup {
        questionGroupCareTaker.selectedQuestionGroup
    }
    
    private var questionIndex = 0
    private let questions: [Question]
    
    
    // MARK: - Object Lifecycle
    public init(questionGroupCareTaker: QuestionGroupCaretaker, questions: [Question]) {
        self.questionGroupCareTaker = questionGroupCareTaker
        self.questions = questions
        
        self.questionGroupCareTaker.selectedQuestionGroup.score = QuestionGroup.Score()
        
    }
    
    // MARK: - QuestionStrategy
    public var title: String {
        questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCareTaker.save()
        guard questionIndex + 1 < questions.count else { return false }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        "\(questionIndex)/\(questions.count)"
    }
}
