//
//  QuestionGroupBuilder.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 20/06/25.
//

import Foundation

public class QuestionBuilder {
    public var answer = ""
    public var hint = ""
    public var prompt = ""
    
    public func build() throws -> Question {
        guard answer.count > 0 else { throw Error.missingAnswer }
        guard prompt.count > 0 else { throw Error.missingPrompt }
        return Question(answer: answer, hint: hint, prompt: prompt)
    }
    
    public enum Error: String, Swift.Error {
        case missingAnswer
        case missingPrompt
    }
}

public class QuestionGroupBuilder {
    
    public var questions = [QuestionBuilder()]
    public var title = ""
    
    public func addNewQuestion() {
        let question = QuestionBuilder()
        questions.append(question)
    }
    
    public func removeQuestion(at index: Int) {
        questions.remove(at: index)
    }
    
    public func build() throws -> QuestionGroup {
        guard self.title.count > 0 else {
            throw Error.missingTitle
        }
        
        let questions = try self.questions.map { try $0.build() }
        return QuestionGroup(questions: questions, score:QuestionGroup.Score() , title: title)
    }
    
    public enum Error: String, Swift.Error {
        case missingTitle
        case missingQuestions
    }
}



