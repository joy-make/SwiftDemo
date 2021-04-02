//
//  SwiftUser.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/10.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwiftUser: NSObject {
    var phoneNumber,avatar,name,birthdate,gender,id :String?
    var loginProviders : Array<NSString>?
    
    static var shareInstance = SwiftUser(json: "")
    
    init(json: JSON) {
        phoneNumber = json["phoneNumber"].stringValue
        avatar = json["avatar"].stringValue
        name = json["name"].stringValue
        birthdate = json["birthdate"].stringValue
        gender = json["gender"].stringValue
        id = json["id"].stringValue
        loginProviders = json["loginProviders"].arrayObject as? Array<NSString>
        let aa = 10 + SCREEN_W
        print(aa)
    }
}
