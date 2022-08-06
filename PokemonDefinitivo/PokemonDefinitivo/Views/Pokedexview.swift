//
//  Pokedexview.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 22/07/2022.
//

import SwiftUI

struct Pokedexview: View {
    var pesquisa: [Pokemon]{
        if search == ""{return viewmodel.pokemon}
        if search == "electric"{return viewmodel.pokemon.filter{$0.type.lowercased().contains("electric".lowercased())}}
        return viewmodel.pokemon.filter{$0.name.lowercased().contains(search.lowercased())}
    }
    private let griditems = [GridItem(.flexible()),GridItem(.flexible())]
    @State private var isShowingDetailView = false
    @ObservedObject var viewmodel = PokemonViewModel()
    @State var search = ""
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                //nada tem de ser loaded ao mesmo tempo na lazy
                
                LazyVGrid(columns: griditems,spacing: 16) {
                    ForEach(pesquisa){pokemon in
                        ContentView(pokemon: pokemon,viewm: viewmodel)
                        }
                    }
            }.navigationTitle("PokeDex").searchable(text: $search)
            }
        
        }
    }
struct Pokedexview_Previews: PreviewProvider {
    static var previews: some View {
        Pokedexview()
    }
}
