//
//  ContentView.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loginVM = LoginVM()
   
    
    var body: some View {
        
        if self.loginVM.isLoggedin{
            
                ProductView()
            
            
        }else{
            
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

