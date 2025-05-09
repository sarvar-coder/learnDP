//
//  QuestionGroupCell.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 13/12/24.
//

import Foundation
import UIKit
import Combine

public class QuestionGroupCell: UITableViewCell {
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var percentageLabel: UILabel!
    
    public var percentageSubscriber: AnyCancellable?
}
