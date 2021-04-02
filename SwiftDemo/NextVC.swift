//
//  NextVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/5.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import Alamofire

class NextVC: UIViewController ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {
    

    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width:self.view.bounds.size.width, height: 200), style: .grouped)

        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
        let className=clsName! + "." + "NextTableCell"
        let cellClass = NSClassFromString(className)!as! UITableViewCell.Type

        tableView.register(cellClass.classForCoder(), forCellReuseIdentifier: "NextTableCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout.init()
        collectionLayout.itemSize = CGSize(width: 80, height: 80)
        collectionLayout.minimumLineSpacing = 15
        collectionLayout.minimumInteritemSpacing = 15
        collectionLayout.scrollDirection = .vertical
        collectionLayout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
//        collectionLayout.headerReferenceSize = CGSize.init(width: 375, height: 80)
//        collectionLayout.footerReferenceSize = CGSize.init(width: 375, height: 80)
        return collectionLayout
    }()
    
    lazy var collectionView : UICollectionView = {
        
        let collectionView = UICollectionView.init(frame:  CGRect(x: 0, y: 200, width:self.view.bounds.size.width, height: 200), collectionViewLayout: collectionLayout)
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
        let className=clsName! + "." + "NextCollectionCell"
        let cellClass = NSClassFromString(className)!as! UICollectionViewCell.Type
        
        collectionView.register(cellClass.classForCoder(), forCellWithReuseIdentifier: "NextCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var dataList: NSMutableArray = {
        let dataList = NSMutableArray.init(objects: "财经","新闻","直播","运动","娱乐","军事","生活","体育","国际")
        return dataList
    }()
    
    lazy var pickView: UIDatePicker = {
        let pickView = UIDatePicker()
        pickView.datePickerMode = .date
        return pickView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "controlDemo"
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(tableView)
        self.view.addSubview(collectionView)

        pickView.frame = CGRect(x: 0, y: self.view.bounds.size.height-200, width: UIScreen.main.bounds.size.width, height: 200)
        self.view.addSubview(pickView)
        
        Alamofire.request("https://cdn.smart.sqbj.com/views/ios/res_device_msg_ui.json").responseJSON { (DataResponse) in
            if  let Json = DataResponse.result.value{
                print("Json:\(Json)")
                if let list = try?JSONSerialization.jsonObject(with: DataResponse.data!, options: .allowFragments) as? Array<Any> {
                    print(list)
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "NextTableCell"
        let cell:JoyTableProtocol = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! JoyTableProtocol
        let model = dataList[indexPath.row]
        cell.setCellModel(model)
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pickView.isHidden = !pickView.isHidden
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:NextCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextCollectionCell", for: indexPath) as! NextCollectionCell
        let name = dataList[indexPath.row]
        cell.setCellModel(name as! NSString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let webVC = WebVC()
        self.navigationController?.pushViewController(webVC, animated: true)
    }

}
