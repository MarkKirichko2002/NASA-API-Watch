//
//  AsteroidsListView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import SwiftUI

struct AsteroidsListView: View {
    
    @ObservedObject var viewModel = AsteroidsListViewModel()
    
    var body: some View {
        List(viewModel.asteroids) { asteroid in
            Text("имя: \(asteroid.name)")
        }.navigationBarTitle("Астероиды")
    }
}

struct AsteroidsListView_Previews: PreviewProvider {
    static var previews: some View {
        AsteroidsListView()
    }
}
