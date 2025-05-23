//
//  AppSettingsViewController.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 17/12/24.
//

import Foundation
import UIKit

public class AppSettingsViewController: UITableViewController {
    
    public let appSettings = AppSettings.shared
    private let cell = "basicCell"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.tableFooterView = UIView()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return QuestionStrategyType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        
        cell.textLabel?.text = questionStrategyType.title()
        
        if appSettings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
