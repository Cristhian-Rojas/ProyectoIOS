

import Foundation

struct Product:Identifiable {
    var id:String = UUID().uuidString
    var name:String
    var image:String
    var price:String
}
