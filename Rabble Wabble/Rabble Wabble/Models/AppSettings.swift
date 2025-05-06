//
//  AppSettings.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 17/12/24.
//

import Foundation


public class AppSettings {
    
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    // MARK: - Static Properties
    static let shared = AppSettings()
    
    // MARK: - Instance Properties
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(
                forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue,
                             forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroupCareTaker: QuestionGroupCaretaker) -> QuestionStrategy {
        
        return questionStrategyType.questionStrategy(for: questionGroupCareTaker)
    }
}
    // MARK: - QuestionStrategyType
    public enum QuestionStrategyType: Int, CaseIterable {
        
        case random
        case sequential
        
        // MARK: - Instance Methods
        public func title() -> String {
            switch self {
            case .random:
                return "Random"
            case .sequential:
                return "Sequential"
            }
        }
        
        public func questionStrategy(for questionGroupCareTaker: QuestionGroupCaretaker) -> QuestionStrategy {
            switch self {
            case .random:
                return RandomQuestionStrategy(questionGroupCaretaker: questionGroupCareTaker)
            case .sequential:
                return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCareTaker)
            }
        }
    }

