//
//  TableProtocol.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit

public protocol JoyTableProtocol: UITableViewCell{

    func setCellModel(_ model:Any)
    
}

class TableProtocol: NSObject {

    class func convertStringToClassStr(_ className:String) -> String{
        //控制器字符串名称
        //获取命名空间也就是项目名称
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        //拼接
        let className=clsName! + "." + className
        return className
    }
    
}
