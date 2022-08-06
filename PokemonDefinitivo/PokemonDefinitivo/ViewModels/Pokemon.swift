//
//  Pokemon.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 22/07/2022.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let attack: Int
    let defense: Int
    let description: String
    let height: Int
    let weight: Int
}

class poke:ObservableObject{
    @Published var s: [Pokemon] = [
        .init(id: 1, name: "Bulbasaur", imageUrl: "", type: "Grass", attack: 69, defense: 0, description: "", height: 70, weight: 69)
        
    ]
}

