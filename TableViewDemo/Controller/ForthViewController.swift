//
//  ForthViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let tableData = [
        "Sound Effect",
        "Dark Mode",
        "Push Notification"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tap on UISwitch"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    private func getSwitch() -> UISwitch {
        
        let customSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        customSwitch.isOn = true
        customSwitch.addTarget(self, action: #selector(toogleEffect(sender:)), for: .valueChanged)
        
        return customSwitch
    }
    
    @objc private func toogleEffect(sender: UISwitch) {
        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        guard let tappedIndexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
            print("Index Path Not Found")
            return
        }
        
        print("Pressed Table Row: \(tappedIndexPath.row)")
    }
    
    private func goToDetailViewController(_ row: Int) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.titleText = "Row \(row)"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ForthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellWithSwitch"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.accessoryView = getSwitch()
        return cell
    }
}

