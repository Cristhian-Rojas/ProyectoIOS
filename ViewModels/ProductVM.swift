//
//  ProductVM.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import Foundation
import FirebaseFirestore

class ProductVM: ObservableObject{
    @Published var products = [Product]()
    private var db = Firestore.firestore()
    
    func getData(){
        db.collection("Product").addSnapshotListener { (result, err) in
            guard let documents = result?.documents else {
                return
            }
            self.products = documents.map { (QueryDocumentSnapshot) -> Product in
                let document = QueryDocumentSnapshot.data()
                
                let name = document["name"] as? String ?? ""
                let price = document["price"] as? String ?? ""
                let image = document["image"] as? String ?? ""
                return Product(name: name, image: image, price: price)
            
            }
            
        }
    }
}
