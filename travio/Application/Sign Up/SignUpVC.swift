//
//  SignUpVC.swift
//  travio
//
//  Created by Doğucan Durgun on 18.08.2023.
//

import UIKit

class SignUpVC: UIViewController {
   
    
    // private lazy var ile instance almak
    
    private lazy var viewModelInstance:SignUpViewModel = {
        let view = SignUpViewModel()
        
        return view
    }()
    
    
    
    private lazy var retangle: UIView = {
        let view = CustomView()
        
        return view
    }()
    
    private lazy var username: CustomTextField = {
        let tf = CustomTextField()
        
        tf.labelText = "Username"
        tf.placeholderName = "bilge_adam"
        
        return tf
    }()
    
    private lazy var mail: CustomTextField = {
        let tf = CustomTextField()
        tf.labelText = "Email"
        tf.placeholderName = "developer@bilgeadam.com"
        
        return tf
    }()
    
    private lazy var password: CustomTextField = {
        let tf = CustomTextField()
        tf.labelText = "Password"
        tf.placeholderName = ""

        return tf
    }()
    
    private lazy var passwordConfirm: CustomTextField = {
        let tf = CustomTextField()
        tf.labelText = "Password Confirm"
        tf.placeholderName = ""
        
        return tf
    }()
    
    private lazy var registerButton: UIButton = {
        let btn = CustomButton()
        btn.labelText = "Register"
        btn.backgroundColor = Colors.gri.color
        
        
        btn.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        return btn
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    func setupViews() {
        view.backgroundColor = Colors.turkuaz.color
        view.addSubview(retangle)
        retangle.addSubview(username)
        retangle.addSubview(mail)
        retangle.addSubview(password)
        retangle.addSubview(passwordConfirm)
        retangle.addSubview(registerButton)
        setupLayouts()
    }
    
    func setupLayouts() {
        retangle.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(124)
            make.leading.trailing.bottom.equalToSuperview().offset(0)
        }
        username.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        mail.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        password.snp.makeConstraints { make in
            make.top.equalTo(mail.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        passwordConfirm.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-23)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    @objc func registerButtonTapped() {

        guard let username = username.txtField.text else {return}
        guard let email = mail.txtField.text else {return}
        guard let password = password.txtField.text else {return}
        
        let data = RegisterInfo(full_name: username, email: email, password: password)
        
        viewModelInstance.register(input: data) {
            print("başarılı")
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
