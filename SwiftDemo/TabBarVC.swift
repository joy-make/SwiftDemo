//
//  TabBarVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let list = [["title":"首页","image":"sc_tabbar_portal_noselected","selectImage":"sc_tabbar_portal_selected","vc":HomeVC(),"tag":1000],["title":"","image":"","selectImage":"","vc":UIViewController(),"tag":1001],["title":"我的","image":"sc_tabbar_me_noselected","selectImage":"sc_tabbar_me_selected","vc":MyVC(),"tag":1003]]
        for dic in list {
            addChildVC(childVC: dic["vc"]as! UIViewController, title: dic["title"] as! String, image: dic["selectImage"] as! String, selectImage: dic["selectImage"] as! String, tag: dic["tag"]as! Int)
        }
//        tabBar.backgroundImage = UIImage()
//        tabBar.shadowImage = UIImage()
        let customBar = CustomTabBar()
        self.setValue(customBar, forKey: "tabBar")
        tabBar.tintColor = UIColor.init(hexString: "#29C885")
        customBar.centerBtn.addTarget(self, action: #selector(cennterBtnAction(btn:)), for: .touchUpInside)
    }
    
    func addChildVC(childVC:UIViewController, title:String, image:String, selectImage:String, tag:Int) {
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImage)
        childVC.tabBarItem.title = title
        childVC.navigationItem.title = title
        childVC.tabBarItem.tag = tag
        let nav:UINavigationController = UINavigationController.init(rootViewController: childVC)
        addChild(nav)
    }
    
    @objc func cennterBtnAction(btn:UIButton){
        
    }
  
}
