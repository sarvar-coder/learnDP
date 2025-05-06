//
//  SequentialQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 14/12/24.
//

import Foundation
    // Concrete Strategy - 1
public class SequentialQuestionStrategy: BaseQuestionStrategy {
  
  public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
    let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
    let questions = questionGroup.questions
    self.init(questionGroupCareTaker: questionGroupCaretaker,
              questions: questions)
  }
}
