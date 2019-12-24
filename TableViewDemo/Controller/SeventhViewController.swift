//
//  SeventhViewController.swift
//  TableViewDemo
//
//  Created by Mazegeek Mac Mini 2018 on 10/25/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class SeventhViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var filterData = [
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
        
        navigationItem.title = "Delete Row"
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

//        tableView.setEditing(editing, animated: true)

//        if editing {
//            addButton.isEnabled = false
//        }
//        else {
//            addButton.isEnabled = true
//        }
    }
}

extension SeventhViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//
//        if indexPath.row == filterData.count-1 {
//            return .insert
//        }
//        else {
//            return .delete
//        }
//    }
//
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            filterData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

