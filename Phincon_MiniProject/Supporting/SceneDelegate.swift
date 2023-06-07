//
//  SceneDelegate.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 01/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        let window = UIWindow(windowScene: windowScene)
        
        let vc = OnboardingViewModel()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        window.rootViewController = nav
        self.window = window
        self.window?.makeKeyAndVisible()
        
        
        let userRequest = RegisterUserRequest(
            username: "reza@gmail.com",
            fullname: "Reza Muda",
            noKTP: 12345,
            password: "password123",
            repeatPassword: "password123"
        )
        
        AuthService.shared.registerUser(with: userRequest) { wasRegistered, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("wasRegistered", wasRegistered)
        }
    }

//    public func checkAuthentication(){
//        if Auth.auth().curren
//    }


}

