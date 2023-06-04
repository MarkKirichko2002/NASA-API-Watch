//
//  EPICImagesListView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct EPICImagesListView: View {
    
    @ObservedObject var viewModel = EPICImagesListViewModel()
    
    var body: some View {
        List(viewModel.epicimages) { epicimage in
            NavigationLink {
                ImageInfoView(imageUrl: viewModel.SetUpImageURL(epic: epicimage), text: epicimage.date)
            } label: {
                HStack {
                    WebImage(url: URL(string: viewModel.SetUpImageURL(epic: epicimage)), options: .highPriority, context: nil)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                    Text(epicimage.date)
                }
            }
        }.navigationBarTitle("EPIC")
        .listStyle(CarouselListStyle())
    }
}

struct EPICImagesListView_Previews: PreviewProvider {
    static var previews: some View {
        EPICImagesListView()
    }
}
