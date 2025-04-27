//
//  QuestionGroup.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 12/12/24.
//

import Foundation

public class QuestionGroup: Codable {
    
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        public init() { }
    }
    
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    public init(questions: [Question],
                score: Score,
                title: String)
    {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
