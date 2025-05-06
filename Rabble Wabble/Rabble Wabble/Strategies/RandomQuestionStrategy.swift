//
//  RandomQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 14/12/24.
//

import Foundation
// 1
import GameplayKit.GKRandomSource
// Concrete Strategy - 2
public class RandomQuestionStrategy: BaseQuestionStrategy {
  
  public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
    let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
    let randomSource = GKRandomSource.sharedRandom()
    let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    self.init(questionGroupCareTaker: questionGroupCaretaker, questions: questions)
  }
}
