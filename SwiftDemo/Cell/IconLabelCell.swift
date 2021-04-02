//
//  IconLabelCell.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class IconLabelCell: UITableViewCell,JoyTableProtocol {
    var iconLabel: UILabel = {
        
        let iconLabel = UILabel()
        iconLabel.textColor = UIColor.darkText
        iconLabel.font = UIFont(name: "iconFont", size: 20)
        return iconLabel
        
    }()

    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.darkText
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        return titleLabel
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
        addSubViews()
        setConstraints()
    }
    
    func addSubViews() {
        self.contentView.addSubview(iconLabel)
        self.contentView.addSubview(titleLabel)
    }
    
    func setConstraints() {
        iconLabel.snp.makeConstraints{
            $0.left.equalTo(20)
            $0.height.width.equalTo(30)
            $0.top.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(iconLabel.snp_right)
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-15)
        }
    }

    func setCellModel(_ model: Any) {
        let dict = model as! Dictionary<String,String>
        iconLabel.text = dict["icon"]
        titleLabel.text = dict["title"]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
