//
//  ProductView.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import SwiftUI
import FirebaseAuth

struct ProductView: View {
    var body: some View {
        Text("productos")
        
        Button(action: {
            self.logout()
        }, label: {Text("Cerrar Sesion")})
        
    }
    
    func logout()  {
        do {
            try Auth.auth().signOut()
        } catch  {
            print("error")
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
