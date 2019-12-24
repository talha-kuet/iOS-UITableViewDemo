//
//  FifthViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let filterData = [
        "Best Match",
        "Low to High",
        "High to Low",
        "New",
        "Used",
        "Refurbished"
    ]
    
    private var currentFilter = "Best Match"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Exclusive Selection List (Only One Row)"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FifthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        cell.selectionStyle = .none
        
        if let filterIndex = filterData.firstIndex(of: self.currentFilter) {
            
            if filterIndex == indexPath.row {
                cell.accessoryType = .checkmark
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let filterIndex = filterData.firstIndex(of: self.currentFilter) else {return}
        
        if indexPath.row == filterIndex {
            return
        }
        
        let oldIndexPath = IndexPath(row: filterIndex, section: 0)
        
        if let newCell = self.tableView.cellForRow(at: indexPath) {
            if newCell.accessoryType == .none {
                newCell.accessoryType = .checkmark
                self.currentFilter = filterData[indexPath.row]
                print("Current Filter: \(self.currentFilter)")
            }
        }
        
        if let oldCell = self.tableView.cellForRow(at: oldIndexPath) {
            if oldCell.accessoryType == .checkmark {
                oldCell.accessoryType = .none
            }
        }
    }
}

