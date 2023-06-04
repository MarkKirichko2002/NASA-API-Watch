//
//  NASAAppNavigationView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import SwiftUI

struct SectionModel: Identifiable {
    let id: Int
    let name: String
    let icon: String
}

struct NASAAppNavigationView: View {
    
    private var sections = [
        SectionModel(id: 1, name: "Изображения", icon: "images"),
        SectionModel(id: 2, name: "Астероиды", icon: "asteroids"),
        SectionModel(id: 3, name: "Марс Погода", icon: "weather")
    ]
    
    var body: some View {
        NavigationView {
            List(sections) { section in
                NavigationLink {
                    switch section.id {
                    case 1:
                        ImageCategoriesView()
                        
                    case 2:
                        AsteroidsListView()
                        
                    case 3:
                        MarsWeatherView()
                        
                    default:
                        EmptyView()
                    }
                } label: {
                    HStack {
                        Image(section.icon)
                        Text(section.name)
                            .fontWeight(.medium)
                    }
                }
            }
            .navigationBarTitle("NASA API")
        }
    }
}

struct NASAAppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NASAAppNavigationView()
    }
}
