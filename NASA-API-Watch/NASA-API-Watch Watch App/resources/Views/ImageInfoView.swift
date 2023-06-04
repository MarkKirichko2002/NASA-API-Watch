//
//  ImageInfoView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageInfoView: View {
    
    var imageUrl: String
    var text: String
    
    var body: some View {
        WebImage(url: URL(string: imageUrl))
            .resizable()
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 130, height: 130)
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 2))
    }
}

struct ImageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInfoView(imageUrl: "", text: "")
    }
}

