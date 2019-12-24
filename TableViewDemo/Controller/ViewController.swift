//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableData = [
        "Tap on Cell",
        "Tap on Detail Disclosure Button",
        "Tap on Custom Detail Button",
        "Tap on UISwitch",
        "Exclusive Selection List (Only One Row)",
        "Inclusive Selection List (More Than One Row)",
        "Delete Row",
        "Insert Row",
        "Delete Multiple Rows"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Table View Demo"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func goToDetailViewController(_ row: Int) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.titleText = "Row \(row)"
        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        if row == 0 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 1 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 2 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 3 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForthViewController") as! ForthViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 4 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 5 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SixthViewController") as! SixthViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 6 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeventhViewController") as! SeventhViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 7 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EighthViewController") as! EighthViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if row == 8 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NinthViewController") as! NinthViewController
            navigationController?.pushViewController(vc, animated: true)
        }
//        else if row == 6 {
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
//            navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    // only calls when accessory tye is detailDisclosureButton
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        print("Accessory Button Tapped Called: \(indexPath.row)")
        
        goToDetailViewController(indexPath.row)
    }
}

