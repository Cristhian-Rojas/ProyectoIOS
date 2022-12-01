//
//  ContentView.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @State private var email:String=""
    @State private var password:String = ""
    
    var body: some View {
        
        VStack{
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: {
                self.login()
            }, label: {
                Text("Ingresar")
            })
        }.padding()

        
        
    }
    
    func login()  {
        Auth.auth().signIn(withEmail: self.email, password: self.password){
            (result, err) in
            if err != nil{
                print("Error de autenticacion")
            }else{
                print("Autenticacion correcta")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
