//
//  NASAImageLibraryListView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NASAImageLibraryListView: View {
    
    @ObservedObject var viewModel = NASAImageLibraryListViewViewModel()
    
    var body: some View {
        List(viewModel.images) { image in
            NavigationLink {
                ImageInfoView(imageUrl: image.NASAImage, text: image.NASAImageTitle)
            } label: {
                HStack {
                    WebImage(url: URL(string: image.NASAImage))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    Text(image.NASAImageTitle)
                }
            }
        }
    }
}

struct NASAImageLibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        NASAImageLibraryListView()
    }
}
