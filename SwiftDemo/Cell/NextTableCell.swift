//
//  NextTableCell.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/5.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit

class NextTableCell: UITableViewCell, JoyTableProtocol {

    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.orange
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        return nameLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews()
    }
    
    func addSubViews() {
        nameLabel.frame = CGRect(x: 15, y: 10, width: 200, height: 20)
        self.contentView.addSubview(nameLabel)
    }
    
    func setCellModel(_ model: Any) {
        nameLabel.text = (model as! String)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
