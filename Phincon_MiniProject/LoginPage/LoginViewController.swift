//
//  LoginViewController.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 02/06/23.
//

import UIKit

class LoginViewController: UIViewController{
    
    private let headerView = HeaderViewLogin(title: "Welcome to Login", subTitle: "Please fill Username & Password to login your app account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let loginButton = CustomButton(title: "Login Now", hasBackground: true, fontSize: .big)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password ?", fontSize: .med)
    private let newUserButton = CustomButton(title: "Don't have account? please Register", fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupUI()
        
        self.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(newUserButton)
        
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        


        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 200),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 40),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 200),
            self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.loginButton.heightAnchor.constraint(equalToConstant: 44),
            self.loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 6),
            self.newUserButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
    @objc private func didTapLogin(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapForgotPassword(){
        let vc = ForgotPasswordViewController()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapNewUser(){
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
