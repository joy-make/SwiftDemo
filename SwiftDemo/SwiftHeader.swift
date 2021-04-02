//
//  SwiftHeader.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/10.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit

typealias VoidClosure   =   () -> Void

typealias AnyClosure    =   (Any) -> Void

typealias BoolClosure   =   (Bool) -> Void

typealias StrClosure    =   (NSString) -> Void

typealias ErrorClosure  =   (Error) -> Void

typealias ArrayClosure  =   (Array<Any>) -> Void

typealias DictClosure   =   (Dictionary<NSString, Any>) -> Void

let       SCREEN_H      =   UIScreen.main.bounds.height

let       SCREEN_W      =   UIScreen.main.bounds.width

let       STATUSBAR_H   =   UIApplication.shared.statusBarFrame.height

let       NAVIBAR_H     =   UINavigationController().navigationBar.frame.size.height

let       W_IPHONEX     =   (Double(SCREEN_W) == Double(375.0) && Double(SCREEN_H) == Double(812.0)) ? true : false

class SwiftHeader: NSObject {

}
