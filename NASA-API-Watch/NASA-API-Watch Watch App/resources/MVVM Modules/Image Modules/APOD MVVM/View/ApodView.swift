//
//  ApodView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ApodView: View {
    
    @ObservedObject var viewModel = ApodViewModel()
    
    var body: some View {
        Form() {
            Section("APOD") {
                WebImage(url: URL(string: viewModel.apod?.hdurl ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
              }
            
            Section("название") {
                Text(viewModel.apod?.title ?? "")
            }
            
            Section("дата") {
                Text(viewModel.apod?.date ?? "")
            }
            
            Section("описание") {
                Text(viewModel.apod?.explanation ?? "")
            }
        }
    }
}

struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        ApodView()
    }
}
