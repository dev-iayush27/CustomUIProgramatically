//
//  CustomTableViewCell.swift
//  CustomUIProgramatically
//
//  Created by Ayush Gupta on 16/09/20.
//  Copyright © 2020 Ayush Gupta. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var myImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        img.image = UIImage(named: "shiva")
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        let attributedText = NSMutableAttributedString(string: "Creating UI Programatically" , attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        title.attributedText = attributedText
        return title
    }()
    
    lazy var subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.numberOfLines = 3
        let attributedText = NSMutableAttributedString(string: "Creating UI Programatically Creating UI Programatically Creating UI Programatically Creating UI Programatically" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12 , weight:.regular)])
        subTitle.attributedText = attributedText
        return subTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(self.myImageView)
        addSubview(self.title)
        addSubview(self.subTitle)
        
        self.setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.myImageView.widthAnchor.constraint(equalToConstant: 80),
            self.myImageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.title.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 15),
            self.title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            self.subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 5),
            self.subTitle.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 15),
            self.subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
