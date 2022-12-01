//
//  LoginVM.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import Foundation
import FirebaseAuth
class LoginVM: ObservableObject {
    @Published var isLoggedin: Bool = false
    
    init(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
                self.isLoggedin = true
            }else{
                self.isLoggedin = false
            }
        }
    }
}
