//
//  LoginVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/8/19.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(logoImageVIew)
        self.view.addSubview(phoneTextField)
        self.view.addSubview(phoneTextBottomView)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordTextBottomView)
        self.view.addSubview(forgetPasswordBtn)
        self.view.addSubview(loginBtn)
    }
    
    func setConstraints(){
        logoImageVIew.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 67))
            $0.top.equalTo(92)
        }
        phoneTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageVIew.snp_bottom).offset(64)
            $0.left.equalTo(38)
            $0.height.equalTo(30)
        }

        phoneTextBottomView.snp.makeConstraints{
            $0.top.equalTo(phoneTextField.snp_bottom).offset(8);
            $0.height.equalTo(1);
            $0.left.right.equalTo(phoneTextField);
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(phoneTextBottomView.snp_bottom).offset(40)
            $0.left.equalTo(38)
            $0.height.equalTo(30)
        }
        
        passwordTextBottomView.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp_bottom).offset(8);
            $0.height.equalTo(1);
            $0.left.right.equalTo(passwordTextField);
        }

        forgetPasswordBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextBottomView.snp_bottom).offset(20)
            $0.right.equalTo(-38)
            $0.height.equalTo(30)
            $0.width.equalTo(70)
        }

        loginBtn.snp.makeConstraints {
            $0.top.equalTo(forgetPasswordBtn.snp_bottom).offset(58)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.left.equalTo(38)
        }
    }
    
    @objc func passwordEyeAction(button:UIButton){
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        let btn = passwordTextField.rightView as! UIButton
        let title = passwordTextField.isSecureTextEntry ? "\u{e707}" : "\u{e712}"
        btn.setTitle(title, for: .normal)
    }
    
    @objc func forgetPasswordAction(button:UIButton){
        
    }
    
    @objc func loginAction(button:UIButton){
        
        LoginNetRequest.login(phoneTextField.text! as NSString, passwordTextField.text! as NSString) { [weak self] in
//            let nextVC = NextVC()
            UIApplication.shared.keyWindow?.rootViewController = TabBarVC()
//            self?.navigationController?.pushViewController(nextVC, animated: true)
            LoginNetRequest.getUserInfo(success: {(response) in
                print(response)
            })
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField == phoneTextField && textField.text!.count<=11) || (textField == passwordTextField)
    }
    
    @objc func textFieldChanged(textField:UITextField){
        if  (phoneTextField.text!.count==11) && (passwordTextField.text!.count>=6){
            loginBtn.isUserInteractionEnabled = true
            loginBtn.backgroundColor = UIColor(red: 11.0/255, green: 185.0/255, blue: 131.0/255, alpha: 1)
        }else{
            loginBtn.isUserInteractionEnabled = false
            loginBtn.backgroundColor = UIColor(red: 11.0/255, green: 185.0/255, blue: 131.0/255, alpha: 0.5)
        }
    }
    
    lazy var logoImageVIew : UIImageView = {
        let logoImageVIew = UIImageView()
        logoImageVIew.contentMode = .scaleAspectFit
        logoImageVIew.image = UIImage(named: "login_logo")
        return logoImageVIew
    }()

    lazy var telephoneCodeBtn : UIButton = {
        let telephoneCodeBtn = UIButton(type: .custom)
        telephoneCodeBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 24)
        telephoneCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        telephoneCodeBtn.setTitle("+86",for: .normal)
        telephoneCodeBtn.setTitleColor(UIColor.black, for: .normal)
        return telephoneCodeBtn
    }()
    
    lazy var phoneTextField : UITextField = {
      let phoneTextField = UITextField()
        phoneTextField.placeholder = "手机号";
        phoneTextField.keyboardType = UIKeyboardType.numberPad;
        phoneTextField.leftViewMode = UITextField.ViewMode.always;
        phoneTextField.leftView = telephoneCodeBtn;
        phoneTextField.text = "13261656316";
        phoneTextField.delegate = self;
        phoneTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        phoneTextField.addTarget(self, action: #selector(textFieldChanged(textField:)), for: .editingChanged)
        
      return phoneTextField
    }()
    
    lazy var phoneTextBottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 229.0/255, green: 229.0/255, blue: 229.0/255, alpha: 1)
        return view
    }()

    
    lazy var passwordTextField : UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "密码";
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = UIKeyboardType.alphabet;
        passwordTextField.rightViewMode = UITextField.ViewMode.always;
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        var eyeBtn = UIButton(type: .custom)
        eyeBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 18)
        eyeBtn.titleLabel?.font = UIFont.init(name: "iconFont", size: 15)
        eyeBtn.setTitle("\u{e707}" , for: .normal)
        eyeBtn.setTitleColor(UIColor(red: 196.0/255, green: 196.0/255, blue: 196.0/255, alpha: 1), for: .normal)
        eyeBtn.addTarget(self, action: #selector(passwordEyeAction(button:)), for: .touchUpInside)
        passwordTextField.rightView = eyeBtn;

        passwordTextField.delegate = self;
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        return passwordTextField
    }()
    
    lazy var passwordTextBottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 229.0/255, green: 229.0/255, blue: 229.0/255, alpha: 1)
        return view
    }()

    lazy var forgetPasswordBtn : UIButton = {
        let forgetPasswordBtn = UIButton(type: .custom)
        forgetPasswordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetPasswordBtn.setTitle("忘了密码?",for: .normal)
        forgetPasswordBtn.setTitleColor(UIColor.lightText, for: .normal)
        forgetPasswordBtn.addTarget(self, action: #selector(forgetPasswordAction(button:)), for: .touchUpInside)
        forgetPasswordBtn.setTitleColor(UIColor.black, for: .normal)
        return forgetPasswordBtn
    }()
    

    lazy var loginBtn : UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        loginBtn.setTitle("登录",for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor(red: 11.0/255, green: 185.0/255, blue: 131.0/255, alpha: 0.5)
        loginBtn.addTarget(self, action: #selector(loginAction(button:)), for: .touchUpInside)
        loginBtn.isUserInteractionEnabled = false
        loginBtn.layer.cornerRadius = 30
        return loginBtn
    }()

}
