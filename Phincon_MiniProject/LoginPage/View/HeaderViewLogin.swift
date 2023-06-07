//
//  HeaderViewLogin.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 02/06/23.
//

import UIKit

class HeaderViewLogin: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    init(title: String, subTitle: String){
        super .init(frame: .zero)
        self.titleLabel.text = title
        self.subtitleLabel.text = subTitle
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }

}
