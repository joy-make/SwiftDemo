//
//  MyVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class MyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var dataArrayM:Array = { () -> [Any] in
        var array = Array<Any>()
        
        var section0:Array = Array<Any>()
        section0.append(["title":"门禁卡","icon":"\u{e71d}","tapAction":"goMyCards"])
        section0.append(["title":"通行记录","icon":"\u{e700}","tapAction":"goMyCards"])
        section0.append(["title":"门列表","icon":"\u{e6fb}","tapAction":"goMyDoors"])
        array.append(["title":"门禁管理","rows":section0])
        var section1:Array = Array<Any>()
        section1.append(["title":"设置","icon":"\u{e70e}","tapAction":"goUserSet"])
        section1.append(["title":"关于","icon":"\u{e6ff}","tapAction":"goAbout"])
        array.append(["title":"其他","rows":section1])
        return array
    }()

    lazy var tableView :UITableView = {
       let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = self.headerView
        let className = TableProtocol.convertStringToClassStr("IconLabelCell")
        let cellClass = NSClassFromString(className)!as! UITableViewCell.Type
        
        tableView.register(cellClass.classForCoder(), forCellReuseIdentifier: "IconLabelCell")
       return tableView
    }()
    
    lazy var headerView:MyHeaderView = {
        let headerView:MyHeaderView = MyHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 154))
        headerView.backgroundColor = UIColor.white
        headerView.touchClorse = { (string) in
            print(string)
        }
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func addSubViews (){
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints{
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(NextVC(), animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArrayM.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var dict : Dictionary = (dataArrayM[section] as? Dictionary<String , Any>)!
        let rows : Array = (dict["rows"] as? Array<Any>)!
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var dict : Dictionary = (dataArrayM[section] as? Dictionary<String , Any>)!
        let title : String = (dict["title"] as? String)!
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "IconLabelCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        
        var dict : Dictionary = (dataArrayM[indexPath.section] as? Dictionary<String , Any>)!
        let rows : Array = (dict["rows"] as? Array<Any>)!
        let cellModel : Dictionary = rows[indexPath.row] as! Dictionary<String,String>
        let protocolCell:JoyTableProtocol = cell as! JoyTableProtocol
        protocolCell.setCellModel(cellModel)
        return cell
    }

}
