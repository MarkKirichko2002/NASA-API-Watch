//
//  MarsPhotosListView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct MarsPhotosListView: View {
    
    @ObservedObject var viewModel = MarsPhotosListViewModel()
    
    var body: some View {
            List(viewModel.photos) { photo in
                NavigationLink {
                    ImageInfoView(imageUrl: photo.imgSrc, text: photo.rover.name)
                } label: {
                    HStack {
                        WebImage(url: URL(string: photo.imgSrc), options: .highPriority, context: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 2))
                        VStack {
                            Text(photo.earthDate)
                            Text(photo.rover.name)
                            Text(photo.camera.name)
                        }
                    }
                }
        }.navigationBarTitle("Фото Марса")
          .listStyle(CarouselListStyle())
    }
}

struct MarsPhotosListView_Previews: PreviewProvider {
    static var previews: some View {
        MarsPhotosListView()
    }
}
