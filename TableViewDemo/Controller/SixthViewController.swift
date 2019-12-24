//
//  SixthViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
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
        
        navigationItem.title = "Inclusive Selection List (More Than One Row)"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SixthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        cell.selectionStyle = .none
        
//        if let filterIndex = filterData.firstIndex(of: self.currentFilter) {
//
//            if filterIndex == indexPath.row {
//                cell.accessoryType = .checkmark
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: false)
        
        guard let cell = self.tableView.cellForRow(at: indexPath) else {return}
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            // Reflect selection in data model
        }
        else if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            // Reflect deselection in data model
        }
    }
}

