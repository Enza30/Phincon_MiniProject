//
//  AuthService.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 07/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    
    public static let shared = AuthService()
    private init() {}
    
    
    
    
    /// A Method to register user
    /// - Parameters:
    ///   - userRequest: The users information (username/email, fullname, noKTP, password, repeatPassword)
    ///   - completion: A completion with two values...
    ///   - Bool: wasRegistered - Determines if the user was registered and saved in database correctly
    ///   - Error?: An optional error if database provides once
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping(Bool, Error?) -> Void) {
        let username = userRequest.username
        let fullname = userRequest.fullname
        let noKTP = userRequest.noKTP
        let password = userRequest.password
        let repeatPassword = userRequest.repeatPassword
        
        Auth.auth().createUser(withEmail: username, password: password) { result,
            error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "fullname": fullname,
                    "noKTP": noKTP
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true,nil)
                }
        }
    }
    
    public func login(with userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.username, password: userRequest.password) {
            result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void){
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
}
