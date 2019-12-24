//
//  ThirdViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tap on Custom Detail Button"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func getButton() -> UIButton {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(buttonPressed(sender:event:)), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonPressed(sender: UIButton, event: UIEvent) {
        
        guard let touches = event.allTouches else {return}
        guard let touch = touches.first else {return}
        
        let currentTouchPosition = touch.location(in: self.tableView)  //Apple Demo Accessory App
        guard let indexPath = self.tableView.indexPathForRow(at: currentTouchPosition) else {
            print("Index Path Not Exist")
            return
        }
        print("Tapped Table Row: \(indexPath.row)")
        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        guard let tappedIndexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
            print("Index Path Not Found")
            return
        }
        print("Pressed Table Row: \(tappedIndexPath.row)")
        
        goToDetailViewController(tappedIndexPath.row)
    }
    
    private func goToDetailViewController(_ row: Int) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.titleText = "Row \(row)"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "StandardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Row  \(indexPath.row)"
        
//        if indexPath.row == 2 {
//            cell.textLabel?.text = "I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain. I dream of rain."
//        }
        
        cell.accessoryView = getButton()
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

