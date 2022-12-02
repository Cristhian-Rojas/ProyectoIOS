
import Foundation
import SwiftUI

let wait = UIImage(named: "placeholder.png")!

struct FirebaseImage : View {
    
    init(id: String){
        self.imageLoader = Loader(id)
    }
    
    @ObservedObject private var imageLoader : Loader
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    var body: some View{
        Image(uiImage: image ?? wait)
            .resizable()
            .frame(width: 80,height: 80)
            .scaledToFit()
            .cornerRadius(20)
            //.cornerRadius(50)
    }
}


