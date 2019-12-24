//
//  EighthViewController.swift
//  TableViewDemo
//
//  Created by Mazegeek Mac Mini 2018 on 10/25/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class EighthViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var namesArray = [
        "Talha",
        "Sakib",
        "Nishan",
        "Zihan",
        "Abid",
        "Ashiq"
    ]
    
    private var currentFilter = "Best Match"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Row"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem(sender:)))
        
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
    
    @objc private func addNewItem(sender: UIBarButtonItem) {
        
        if #available(iOS 13.0, *) {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddNewItemViewController") as! AddNewItemViewController
            vc.delegate = self
            present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewItemViewController") as! AddNewItemViewController
            vc.delegate = self
            present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        }
        
    }
}

extension EighthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
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
            namesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension EighthViewController: AddNewItemViewControllerDelegate {
    func getName(text: String) {
        
        namesArray += [text]
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: namesArray.count-1, section: 0)], with: .fade)
        tableView.endUpdates()
    }
}

