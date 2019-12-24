//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Musaddique Billah Talha on 10/23/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK:- Properties
    var titleText = ""
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = titleText
    }

}
