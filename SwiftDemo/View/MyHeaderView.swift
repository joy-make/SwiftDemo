//
//  MyHeaderView.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class MyHeaderView: UIView {
    var touchClorse : StrClosure?

    lazy var titleLabel:UILabel = {
        let view:UILabel = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.text = "👀"
        return view
    }()
    
    lazy var subTitleLabel:UILabel = {
        let view:UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 14)
        view.text = "智能设备"
        view.textColor = UIColor.init(hexString: "#666666")
        return view
    }()
    
    lazy var backImageView:UIImageView = {
        let imageView:UIImageView = UIImageView(image: UIImage(named:"user_backImage"))
        return imageView
    }()
    
    lazy var avatarView:UIImageView = {
        let imageView:UIImageView = UIImageView(image: UIImage(named:"photo_user"))
        imageView.layer.masksToBounds = true;
        imageView.layer.cornerRadius = 30;
        imageView.layer.borderWidth=0.5;
        imageView.layer.borderColor = UIColor.init(hexString: "#0BB983").cgColor;
        return imageView
    }()
    
    lazy var noticeBtn:UIButton = {
       let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont(name: "iconfont", size: 20)
        btn.setTitleColor(UIColor.init(hexString: "#333333"), for: .normal)
        btn.setTitle("\u{e70b}", for: .normal)
        btn.addTarget(self, action: #selector(goNoticeCenter), for: .touchUpInside)
        return btn
    }()
    
    lazy var noticeCountLabel:UILabel = {
        let view:UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 20)
        view.text = "10"
        view.textColor = UIColor.white;
        view.backgroundColor = UIColor.init(hexString: "#FF5B61");
        view.layer.masksToBounds = true;
        view.layer.cornerRadius = 3;
        view.font = UIFont.systemFont(ofSize: 10);
        view.textAlignment = .center;
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addsubViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addsubViews(){
        addSubview(backImageView);
        addSubview(titleLabel);
        addSubview(subTitleLabel);
        addSubview(avatarView);
        addSubview(noticeBtn);
        noticeBtn.addSubview(noticeCountLabel);
    }
    

    func setConstraints(){

        backImageView.snp.makeConstraints{
            $0.leading.top.bottom.equalToSuperview();
            $0.width.equalTo(backImageView.snp_height).multipliedBy(267/130);
        }

        avatarView.snp.makeConstraints{
            $0.top.equalTo(44+40);
            $0.leading.equalTo(20);
            $0.width.height.equalTo(60);
        }

        titleLabel.snp.makeConstraints{
            $0.left.equalTo(avatarView.snp_right).offset(16);
            $0.bottom.equalTo(avatarView.snp_centerY).offset(-5);
            $0.right.equalTo(-20);
        }

        subTitleLabel.snp.makeConstraints{
            $0.left.equalTo(titleLabel.snp_left);
            $0.top.equalTo(avatarView.snp_centerY).offset(5);
            $0.right.equalTo(-20);
        }

        noticeBtn.snp.makeConstraints{
            $0.trailing.equalTo(-20);
            $0.centerY.equalTo(avatarView);
            $0.height.width.equalTo(25);
        }

        noticeCountLabel.snp.makeConstraints{
            $0.centerY.equalTo(noticeBtn.snp_top);
            $0.centerX.equalTo(noticeBtn.snp_right);
            $0.height.equalTo(12);
        }
    }

    @objc func goNoticeCenter(_ btn:UIButton){
        if (self.touchClorse != nil){
            self.touchClorse!("fef")
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
