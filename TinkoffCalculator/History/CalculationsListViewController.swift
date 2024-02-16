//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by Yoji on 25.01.2024.
//

import UIKit

final class CalculationsListViewController: UIViewController {
//    MARK: Variables
    @IBOutlet weak var tableView: UITableView!
    var calculations: [Calculation] = []
    
    private lazy var tableFooterView: UIView = {
        let headertView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
        return headertView
    }()
    
//    MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .systemGray5
        self.tableView.tableFooterView = self.tableFooterView
        
        let cellNib = UINib(nibName: "HistoryTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HistoryTableViewCell")
        tableView.register(
            HistoryTableViewHeader.self,
            forHeaderFooterViewReuseIdentifier: "HistoryTableViewHeader"
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

//  MARK: Extensions
extension CalculationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryTableViewHeader") as? HistoryTableViewHeader else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let date = calculations[section].date
        let formattedDate = formatter.string(from: date)
        header.configure(with: formattedDate)
        
        return header
    }
}

extension CalculationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.calculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell else {
            let cell = UITableViewCell()
            return cell
        }
        let historyItem = calculations[indexPath.section]
        cell.configure(with: historyItem.expression.toString(), result: String(historyItem.result))
        
        return cell
    }
}

extension Array<CalculationHistoryItem> {
    func toString() -> String {
        var result = ""
        
        self.forEach { operand in
            switch operand {
            case let .number(value):
                result += String(value) + " "
            case let .operation(value):
                result += value.rawValue + " "
            }
        }
        
        return result
    }
}
