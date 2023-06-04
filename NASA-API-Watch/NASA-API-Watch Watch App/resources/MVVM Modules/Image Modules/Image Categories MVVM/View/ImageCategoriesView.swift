//
//  ImageCategoriesView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCategoriesView: View {
    
    @ObservedObject var viewModel = ImageCategoriesViewModel()
    
    var body: some View {
        List(viewModel.categories) { category in
            NavigationLink {
                switch category.id {
                case 1:
                    ApodView()
                case 2:
                    MarsPhotosListView()
                case 3:
                    NASAImageLibraryListView()
                case 4:
                    EPICImagesListView()
                default:
                    EmptyView()
                }
            } label: {
                HStack(spacing: 15) {
                    WebImage(url: URL(string: category.icon))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                    VStack(alignment: .leading, spacing: 10) {
                        Text(category.name)
                            .fontWeight(.medium)
                        Text("кол-во: \(category.itemsCount)")
                    }
                }
            }
        }.navigationBarTitle("Изображения")
    }
}

struct ImageCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCategoriesView()
    }
}
