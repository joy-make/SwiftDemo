//
//  LoginNetRequest.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/10.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginNetRequest: NSObject {
static let hostUrl = "https://uat.akita.sqbj.tech/"
static let Authorization : NSString = "Authorization"
    //登录
    class func login(_ phone:NSString, _ password:NSString, _ success:@escaping VoidClosure){
        let url = hostUrl + "uaa/oauth/token"
        let loginRequest = ["username":phone,"password":password,"grant_type":"password"]
        let headers = ["client_secret":"123456","Authorization":"Basic ZGVmYXVsdDoxMjM0NTY="]
        Alamofire.request(url, method: .post, parameters: loginRequest, encoding: URLEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if  let Json = response.result.value{
                        print("Json:\(Json)")
                        if let list = try?JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? NSDictionary {
                            let access_token  = list["access_token"]
                            UserDefaults.standard.setValue(("Bearer " + (access_token as! String)), forKey: Authorization as String)
                            UserDefaults.standard.synchronize()
                        }
                    }

                    success ()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //获取用户信息
    class func getUserInfo(success:@escaping AnyClosure){
        let headers = ["client_id":"default","Content-Type":"application/json","app_id":"prop-pro-ios","Authorization":UserDefaults.standard.object(forKey: Authorization as String)]

        Alamofire.request(hostUrl + "uaa/users/profile", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers as? HTTPHeaders).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do{
                    let jsonData = JSON(value)
                    SwiftUser.shareInstance = SwiftUser(json: jsonData)
                    success (jsonData as AnyObject)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
