//
//  String+Extention.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/21.
//  Copyright © 2019 IB. All rights reserved.
//

import Foundation

extension String{
    func convertStringToClass() -> AnyClass{
        //控制器字符串名称
        //获取命名空间也就是项目名称
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        
        //拼接
        let className=clsName! + "." + self
        
        //字符串转Class 需要注意的是这里的`UIViewController`强转必须带上`.Type`,否则转换不成功
        let classT = NSClassFromString(className)! as! AnyClass.Type
        
        return classT
    }
}
