//
//  Loader.swift
//  Proyecto
//
//  Created by Cristhian on 01/12/2022.
//

import SwiftUI
import Combine
import FirebaseStorage

final class Loader : ObservableObject   {
    @Published var data: Data? = nil

    init(_ id: String){
        // the path to the image
        let url = "images/\(id)"
        let storage = Storage.storage()
        let ref = storage.reference().child(url)
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("\(error)")
            }
            self.data = data
            
        }
    }
}

