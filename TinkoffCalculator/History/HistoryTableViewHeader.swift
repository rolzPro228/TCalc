//
//  HistoryTableViewHeader.swift
//  TinkoffCalculator
//
//  Created by Yoji on 01.02.2024.
//

import UIKit

final class HistoryTableViewHeader: UITableViewHeaderFooterView {
    private lazy var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
//  MARK: Inits
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: Setups
    func configure(with date: String) {
        self.dateLabel.text = date
    }
    
    private func setupViews() {
        self.addSubview(self.dateLabel)
        
        NSLayoutConstraint.activate([
            self.dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.dateLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
