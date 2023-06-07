//
//  ForgotPasswordViewController.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 02/06/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private let headerView = HeaderViewLogin(title: "Forgot Password", subTitle: "Please fill Username, No.KTP, Password & New Password to register your account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let noKTPField = CustomTextField(fieldType: .noKTP)
    
    private let passwordField = CustomTextField(fieldType: .password)
    private let repeatPasswordField = CustomTextField(fieldType: .repeatPassword)
    
    private let resetPasswordButton = CustomButton(title: "Reset Password", hasBackground: true, fontSize: .big)
    private let loginButton = CustomButton(title: "Already have account? please Login", fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupUI()
        
        self.resetPasswordButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(noKTPField)
        self.view.addSubview(passwordField)
        self.view.addSubview(repeatPasswordField)
        self.view.addSubview(resetPasswordButton)
        self.view.addSubview(loginButton)
        
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        noKTPField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        


        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 200),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.noKTPField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 12),
            self.noKTPField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.noKTPField.heightAnchor.constraint(equalToConstant: 55),
            self.noKTPField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: noKTPField.bottomAnchor, constant: 22),
            self.passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.repeatPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.repeatPasswordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.repeatPasswordField.heightAnchor.constraint(equalToConstant: 55),
            self.repeatPasswordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.resetPasswordButton.topAnchor.constraint(equalTo: repeatPasswordField.bottomAnchor, constant: 100),
            self.resetPasswordButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.loginButton.topAnchor.constraint(equalTo: resetPasswordButton.bottomAnchor, constant: 6),
            self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.loginButton.heightAnchor.constraint(equalToConstant: 44),
            self.loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
    @objc private func didTapReset(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @objc private func didTapLogin(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
