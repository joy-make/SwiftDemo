//
//  CustomTabBar.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class CustomTabBar: UITabBar {
    
    lazy var centerBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "sc_tabbar_center"), for: .normal)
        btn.adjustsImageWhenHighlighted = false
        return btn
    }()
    
    lazy var backImageView:UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "sc_tabar_backImage"))
       imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.addSubview(backImageView)
        self.addSubview(centerBtn)
        self.isTranslucent = false
        self.tintColor = UIColor(red: 27.0/255.0, green: 118.0/255.0 , blue: 208/255.0, alpha: 1)
        setConstraints()
    }
    
    func setConstraints(){
        backImageView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
//            $0.top.equalTo(-20)
            $0.bottom.equalTo(0)
//            $0.height.equalTo(backImageView.snp_width).multipliedBy(101/375.0)
            $0.height.equalTo(150)

        }
        
        centerBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(-20)
            $0.height.width.equalTo(71)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /// 判断是否为根控制器
        if self.isHidden {
            /// tabbar隐藏 不在主页 系统处理
            return super.hitTest(point, with: event)
            
        }else{
            /// 将单钱触摸点转换到按钮上生成新的点
            let onButton = self.convert(point, to: centerBtn)
            /// 判断新的点是否在按钮上
            if centerBtn.point(inside: onButton, with: event){
                return centerBtn
            }else{
                /// 不在按钮上 系统处理
                return super.hitTest(point, with: event)
            }
        }
    }
}
