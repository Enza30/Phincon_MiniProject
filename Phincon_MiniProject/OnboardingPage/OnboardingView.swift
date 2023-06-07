//
//  OnboardingView.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 02/06/23.
//

import UIKit

class OnboardingView: UIViewController {
    
    let stackVIew = UIStackView()
    
    let imageView =  UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension OnboardingView {
    
    func style() {
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        stackVIew.axis = .vertical
        stackVIew.alignment = .center
        stackVIew.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .center
        
        subtitleLabel.numberOfLines = 0
    }
    
    func layout(){
        stackVIew.addArrangedSubview(imageView)
        stackVIew.addArrangedSubview(titleLabel)
        stackVIew.addArrangedSubview(subtitleLabel)
        
        view.addSubview(stackVIew)
        
        NSLayoutConstraint.activate([
            stackVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackVIew.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2)
        ])
    }
}
