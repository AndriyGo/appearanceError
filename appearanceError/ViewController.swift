//
//  ViewController.swift
//  appearanceError
//
//  Created by Andriy Gordiychuk on 26/09/2018.
//  Copyright © 2018 Glenmax Ltd. All rights reserved.
//

import UIKit

final class MyCell: UITableViewCell {
    lazy var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
}

class ViewController: UIViewController, UIViewControllerRestoration, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyCell
        cell.label.text = "I should be 22 points!!!"
        return cell
    }
    
    static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        return ViewController()
    }
    
    lazy var tableView:UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tv)
        tv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tv.dataSource = self
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        restorationClass = ViewController.self
        restorationIdentifier = "vc"
        view.backgroundColor = UIColor.white
        tableView.register(MyCell.self, forCellReuseIdentifier: "MyCell")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

