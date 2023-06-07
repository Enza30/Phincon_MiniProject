//
//  CustomButton.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 07/06/23.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemYellow : .clear
        
        let titleColor: UIColor = hasBackground ? .black : .white
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
