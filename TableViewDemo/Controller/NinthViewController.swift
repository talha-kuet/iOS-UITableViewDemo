//
//  NinthViewController.swift
//  TableViewDemo
//
//  Created by Mazegeek Mac Mini 2018 on 10/25/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class NinthViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    private var placesArray = [
        "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma", "Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Rangpur", "Padma"
    ]
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Delete Multiple Rows"
        
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteRows(_:)))
        navigationItem.rightBarButtonItems = [deleteButton, editButtonItem]
        
        setupTableView()
    }
    
    //MARK:- Setup UI
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    //MARK:- Button Actions
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: animated)
    }
    
    @objc private func deleteRows(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing == true {
            
            if var selectedIndexPath = tableView.indexPathsForSelectedRows {
               
                selectedIndexPath = selectedIndexPath.sorted(by: { (first, second) -> Bool in
                    return first.row > second.row
                })
                
                for indexPath in selectedIndexPath {
                    placesArray.remove(at: indexPath.row)
                }
                
                tableView.beginUpdates()
                tableView.deleteRows(at: selectedIndexPath, with: .fade)
                tableView.endUpdates()
            }
        }
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension NinthViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = placesArray[indexPath.row]
        cell.selectionStyle = .default
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    {
        return .none
    }
    
    //Multiple selection methods with two finger.
    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        return false
    }
//
//    func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
////        self.setEditing(true, animated: true)
//    }
//
//    func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
//        print("\(#function)")
//    }
}
