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
    @State private var isPresented:Bool = false
    var body: some View {
        
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30,style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000,height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-500)
            
            VStack{
                Text("Iniciar Sesion")
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .bold,design: .rounded))
                    .offset(y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundColor(.white)
                
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundColor(.white)
                
                Button(action: {
                    self.login()
                }, label: {
                    Text("Ingresar")
                        .bold()
                        .frame(width: 200,height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.blue,.green], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                })
                .offset(y: 100)
                .alert(isPresented: $isPresented, content: {
                    Alert(title: Text("AVISO"), message: Text("Error de Autenticacion"),
                          dismissButton: .destructive(Text("Aceptar")))
                })
            }
            .padding()
            .frame(width: 350)
            
        }
        .ignoresSafeArea()
    }
    
    func login()  {
        Auth.auth().signIn(withEmail: self.email, password: self.password){
            (result, err) in
            if err != nil{
                self.isPresented = true
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

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
                
            }
        }
}
