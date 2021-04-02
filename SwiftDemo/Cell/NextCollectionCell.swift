//
//  NextCollectionCell.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/5.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit

class NextCollectionCell: UICollectionViewCell {
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        return nameLabel
    }()

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
    }
    func addSubViews() {
        nameLabel.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        self.contentView.addSubview(nameLabel)
    }
    
    func setCellModel(_ name:NSString) {
        nameLabel.text = name as String
        self.contentView.backgroundColor = self.armColor()
    }

    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
