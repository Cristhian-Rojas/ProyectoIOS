//
//  ProductView.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import SwiftUI
import FirebaseAuth

struct ProductView: View {
    @ObservedObject var productVM = ProductVM()
    var body: some View {
      
        
        
        
        NavigationView{
            List(productVM.products){ product in
                
                HStack{
                    
                    FirebaseImage(id: product.image)
                        .frame(width: 5,height: 2)
                        .padding(.horizontal ,30)
                        .padding(.vertical, 20)
                    Spacer()
                    
                    VStack{
                        Text(product.name).font(.title)
                        Text(product.price).font(.caption)
                        
                    }
                    .offset(x:80)
                  
                    NavigationLink(destination: CartView(nombre: product.name, precio: product.price, img: product.image), label: {
                      
                    })
                    
                }
            }
            .onAppear(){
                self.productVM.getData()
            }
            .navigationTitle(Text("Productos"))
            
        }
            
        
            
            
        
     
        
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
