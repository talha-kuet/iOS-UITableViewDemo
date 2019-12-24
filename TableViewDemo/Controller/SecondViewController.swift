//
//  SecondViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tap on Detail Disclosure Button"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    private func goToDetailViewController(_ row: Int) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.titleText = "Row \(row)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Row  \(indexPath.row)"
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    // only calls when accessory tye is detailDisclosureButton
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        print("Accessory Button Tapped Called: \(indexPath.row)")
        
        goToDetailViewController(indexPath.row)
    }
}

