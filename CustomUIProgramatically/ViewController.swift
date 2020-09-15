//
//  ViewController.swift
//  CustomUIProgramatically
//
//  Created by Ayush Gupta on 16/09/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var navBar: UIView = {
        let navBar = UIView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.backgroundColor = .white
        return navBar
    }()
    
    lazy var navTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        let attributedText = NSMutableAttributedString(string: "Programatic UI" , attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        title.attributedText = attributedText
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(self.tableView)
        view.addSubview(self.navBar)
        self.navBar.addSubview(self.navTitle)
        
        self.setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            self.navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            self.navBar.heightAnchor.constraint(equalToConstant: 44),
            
            self.navTitle.centerXAnchor.constraint(equalTo: self.navBar.centerXAnchor),
            self.navTitle.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: 5),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
