//
//  HomeVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/20.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController , UITextFieldDelegate{
    //😊UILabel 标签
    lazy var versionLabel : UILabel = {
        let versionLabel = UILabel()
        versionLabel.font = UIFont(name:"Zapfino", size:10)
        versionLabel.textAlignment = .center
        versionLabel.shadowColor = UIColor.gray  //灰色阴影
        versionLabel.shadowOffset = CGSize(width:1.5, height:1.5)  //阴影的偏移量
        versionLabel.lineBreakMode = .byTruncatingTail
        let attributeString = NSMutableAttributedString(string:"welcome to swift")
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0,6))
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSMakeRange(0, 3))
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.green, range: NSMakeRange(3,3))
        versionLabel.attributedText = attributeString
        return versionLabel
    }()
    
    //😊UIImageView logo
    lazy var logoImgView : UIImageView = {
        let logoImgView = UIImageView()
        logoImgView.contentMode = .scaleAspectFill
        logoImgView.image = UIImage(named: "g3_portal_through_person")
        return logoImgView
    }()
    
    //😊UITextField 账号框
    lazy var nameTextField : UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "请输入用户手机号"
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.keyboardType = UIKeyboardType.numberPad
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        return nameTextField;
    }()
    
    //😊UITextField 密码框
    lazy var passwordTextField : UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.keyboardType = UIKeyboardType.emailAddress
        passwordTextField.isSecureTextEntry = true;
        passwordTextField.delegate = (self as UITextFieldDelegate)
        passwordTextField.returnKeyType = .done
        return passwordTextField;
    }()
    
    //😊UITextField 登录按钮
    lazy var loginBtn : UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.orange, for: .normal)
        loginBtn.setTitleColor(UIColor.green, for: .selected)
        loginBtn.addTarget(self, action: #selector(testAction(button:)), for: .touchUpInside)
        loginBtn.layer.borderColor = UIColor.orange.cgColor;
        loginBtn.layer.masksToBounds = true;
        loginBtn.layer.borderWidth = 0.5;
        loginBtn.layer.cornerRadius = 30;
        loginBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        loginBtn.imageEdgeInsets = UIEdgeInsets(top: -10, left: -20, bottom: -10, right: 0)
        loginBtn.setImage(UIImage(named: "g3_portal_through_person"), for: .normal)
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return loginBtn
    }()
    
    //😊UITextView 文本编辑
    lazy var infoTextView : UITextView = {
        let infoTextView = UITextView()
        infoTextView.layer.borderColor = UIColor.orange.cgColor
        infoTextView.layer.cornerRadius = 5
        infoTextView.layer.borderWidth = 1
        infoTextView.textAlignment = .center
        infoTextView.isEditable = false
        infoTextView.isSelectable = true
        infoTextView.dataDetectorTypes = .all
        infoTextView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        infoTextView.text = "从明天起，做一个幸福的人\n喂马，劈柴，周游世界\n从明天起，关心粮食和蔬菜\n我有一所房子，面朝大海，春暖花开\n从明天起，和每一个亲人通信\n告诉他们我的幸福\n那幸福的闪电告诉我的\n我将告诉每一个人\n给每一条河每一座山取一个温暖的名字\n phone:13859222222,\n link:https://www.baidu.com"
        let wx = UIMenuItem(title: "微信", action: #selector(openWX))
        let menu = UIMenuController()
        menu.menuItems = [wx]
        return infoTextView
    }()
    
    //😊开关
    lazy var swiftSwitch: UISwitch = {
        let swiftSwitch = UISwitch()
        swiftSwitch.onTintColor = UIColor.purple
        swiftSwitch.tintColor = UIColor.blue
        swiftSwitch.thumbTintColor = UIColor.orange
        swiftSwitch.addTarget(self, action: #selector(switchDidChanged(_ :)), for: .valueChanged)
        return swiftSwitch
    }()
    
    //😊UIStepper步进器
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.maximumValue = 10
        stepper.minimumValue = 2
        stepper.stepValue = 2
        stepper.isContinuous = true //是否可以按住不放步进
        stepper.wraps = true //是否允许循环
        stepper.addTarget(self, action: #selector(stepperValueChanged(_ :)), for: .valueChanged)
        stepper.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)          //放大缩小视图
        //        stepper.setDecrementImage(UIImage(named:"voice-"), for: .normal)
        //        stepper.setIncrementImage(UIImage(named:"voice+"), for: .normal)
        //        stepper.setDividerImage(UIImage(named:"divider"), forLeftSegmentState: .normal, rightSegmentState: .normal)
        return stepper
    }()
    
    //😊UISlider步进器
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.3
        slider.minimumTrackTintColor = UIColor.green
        slider.maximumTrackTintColor = UIColor.orange
        //        slider.minimumValueImage = UIImage(named:"voice-")  //左边图标
        //        slider.maximumValueImage = UIImage(named:"voice+")  //右边图标
        //        slider.setThumbImage(UIImage(named:"voice"), for: .normal)//设置滑块图片
        slider.addTarget(self, action: #selector(sliderValueChanged(_ :)), for: .valueChanged)
        return slider
    }()
    
    //😊UIProgressView进度条
    lazy var progress: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        progress.trackTintColor = UIColor.red
        progress.progressTintColor = UIColor.green
        progress.tintColor = UIColor.orange
        progress.setProgress(0.7, animated: true)
        return progress
    }()
    
    //😊UISegmentedControl分段控制器
    lazy var segment: UISegmentedControl = {
        let items = ["昨天","今天","明天"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 1
        segment.addTarget(self, action: #selector(segmentChanged(_ :)), for: .valueChanged)
        return segment
    }()
    
    lazy var activity: UIActivityIndicatorView = {
       let activity = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.gray)
        activity.tintColor = UIColor.orange
        activity.color = UIColor.green
        activity.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
       return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "rootVC"
        self.navigationController?.navigationBar.isTranslucent = false
        addSubViews()
        setConstraint()
        activity.startAnimating()
    }
    
    func addSubViews(){
        self.view.addSubview(versionLabel)
        self.view.addSubview(logoImgView)
        self.view.addSubview(nameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(infoTextView)
        self.view.addSubview(swiftSwitch)
        self.view.addSubview(stepper)
        self.view.addSubview(slider)
        self.view.addSubview(progress)
        self.view.addSubview(segment)
        self.view.addSubview(activity)
    }
    
    func setConstraint()  {
        versionLabel.snp.makeConstraints{
            $0.left.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(30)
        }
        
        logoImgView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(150)
            $0.width.height.equalTo(80)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImgView.snp_bottom).offset(30)
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameTextField.snp_bottom).offset(30)
            $0.width.height.equalTo(nameTextField)
        }
        
        loginBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp_bottom).offset(10)
            $0.size.equalTo(CGSize(width: 200, height: 60))
        }
        
        infoTextView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginBtn.snp_bottom).offset(10)
            $0.left.equalTo(30)
            $0.height.equalTo(100)
        }
        
        swiftSwitch.snp.makeConstraints{
            $0.top.equalTo(infoTextView.snp_bottom).offset(10)
            $0.left.equalTo(30)
            $0.size.equalTo(CGSize(width: 60, height: 30))
        }
        stepper.snp.makeConstraints{
            $0.centerY.equalTo(swiftSwitch)
            $0.left.equalTo(swiftSwitch.snp_right).offset(50)
            $0.size.equalTo(CGSize(width: 100, height: 30))
        }
        
        slider.snp.makeConstraints{
            $0.top.equalTo(swiftSwitch.snp_bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 210, height: 10))
        }
        
        progress.snp.makeConstraints{
            $0.top.equalTo(slider.snp_bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 210, height: 3))
        }
        
        segment.snp.makeConstraints{
            $0.top.equalTo(progress.snp_bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 210, height: 35))
        }
    }
    
    @objc func testAction(button:UIButton){
        button.isSelected = !button.isSelected;
//        LoginNetRequest.login(self.nameTextField.text! as NSString, self.passwordTextField.text! as NSString) { [weak self] in
            let nextVC = NextVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
            LoginNetRequest.getUserInfo(success: {(response) in
                print(response)
            })
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(passwordTextField.text?.isEqual("dd") ?? false){
            print("11");
        }
        if((passwordTextField.text?.isEqual("ee"))! ){
            print("相等")
        }
        
        print(textField.text ?? "")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(textField.text ?? "")
    }
    
    @objc func switchDidChanged(_ switch:UISwitch) {
        print("switchValueChanged")
    }
    
    @objc func stepperValueChanged(_ stepper:UIStepper){
        print(stepper.value)
    }
    
    @objc func sliderValueChanged(_ slider:UISlider){
        print(slider.value)
    }
    
    @objc func segmentChanged(_ segment: UISegmentedControl) {
        print(segment.selectedSegmentIndex)
    }
    
    @objc override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        HIDE_KEYBOARD()
    }
    
    @objc func openWX(){
        print("打开微信")
    }
    
    func HIDE_KEYBOARD(){
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
