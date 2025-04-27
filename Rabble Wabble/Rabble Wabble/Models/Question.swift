//
//  Question.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 12/12/24.
//

import Foundation

public struct Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String,
                hint: String?,
                prompt: String)
    {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
