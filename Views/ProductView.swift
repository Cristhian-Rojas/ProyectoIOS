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
        HStack{
            Text("Shop")
                .padding(7)
                .bold()
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName: "cart")
                    .padding(7)
                    .foregroundColor(.black)
            })
            
        }
                List(productVM.products){ product in
                    
                    HStack{
                        
                        FirebaseImage(id: product.image)
                            .frame(width: 5,height: 2)
                            .padding(.horizontal,30)
                        Spacer()
                        
                        VStack{
                            Text(product.name).font(.title)
                            Text(product.price).font(.caption)
                            
                        }
                        .padding()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.black)
                                .cornerRadius(50)
                        })
                    }
                }
                .onAppear(){
                    self.productVM.getData()
                    
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
