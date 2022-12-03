//
//  CartView.swift
//  Proyecto
//
//  Created by Cristhian on 02/12/2022.
//

import SwiftUI

struct CartView: View {
    let nombre:String
        let precio:String
        let img:String
        @State private var cantidad:String = "1"
        @State private var showingConfirmAlert = false
         @State private var showingAlert = true
        
        var body: some View {
            VStack{
                FirebaseImage(id: img)
                        
                Text(nombre)
                .font(.title)
                
                Text(precio)
                .font(.title)
                
                HStack{
                    VStack{
                        Text("Ingresar cantidad")
                        TextField(" Cantidad", text: $cantidad)
                            .padding() .frame(width: 200).offset(x:50)
                        
                    }
                    Spacer()
                    VStack{
                        Button(action: {
                            self.showingConfirmAlert = true
                        }, label: {
                            ZStack(alignment: .center){
                                Text("Comprar Ahora").font(.body).foregroundColor(.white)
                            }.frame(height: 60).frame(width: 100) .background(Color(.blue).cornerRadius(5))
                        })
                        .alert(isPresented: $showingConfirmAlert) {
                            Alert(
                                title: Text("DETALLE DE COMPRA"),
                                message: Text("COMPRA REALIZADA CON EXITO!" + "Gracias, su pedido llegara pronto.  "+self.cantidad + " Unidades de: " + nombre),
                                primaryButton: .default( Text("Aceptar")) {

                                    print("Aceptado...")
                                },secondaryButton: .destructive( Text("Volver")) {
                                    print("canceling...")
                                })
                        }
                        
                    }
                }.padding(.vertical, 30).padding(.horizontal, 10)
                
            }
        }
    }

    struct Shop_Previews: PreviewProvider {
        static var previews: some View {
            CartView(nombre: "Nombre", precio: "10.00", img: "nuevo")
        }
    }
