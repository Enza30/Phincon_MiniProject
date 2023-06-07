//
//  CustomTextField.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 07/06/23.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case fullname
        case password
        case repeatPassword
        case noKTP
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        
        switch fieldType{
        case .username:
            self.placeholder = "Username/Email"
            self.textContentType = .emailAddress
        case .fullname:
            self.placeholder = "Fullname"
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .repeatPassword:
            self.placeholder = "Repeat Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .noKTP:
            self.placeholder = "No KTP"
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
