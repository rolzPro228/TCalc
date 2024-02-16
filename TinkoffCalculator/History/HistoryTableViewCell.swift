//
//  HistoryTableViewCell.swift
//  TinkoffCalculator
//
//  Created by Yoji on 31.01.2024.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    @IBOutlet private weak var expressionLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    func configure(with expression: String, result: String) {
        self.expressionLabel.text = expression
        self.resultLabel.text = result
    }
}
