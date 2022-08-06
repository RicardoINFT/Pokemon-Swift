//
//  listadospokemongusa.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 26/07/2022.
//

import Foundation

struct PartyPokemons:Identifiable{
    var id = UUID()
    var Dex: Int
    var vida: Int
    var peso: Int
    var velocidade: Double
    var ataque: Int
    var foto: String
    var nome: String
}

class PartyModel:ObservableObject{
    @Published var s: [PartyPokemons] = [
        .init(Dex: 1, vida: 39, peso: 69, velocidade: 70, ataque: 49, foto: "", nome: "Bulbasaur")
    ]
}
struct Ataquesl:Identifiable{
    var id = UUID()
    var ataque1: String
    var dano1: Int
    var ataque2:String
    var dano2: Int
    var ataque3: String
    var dano3: Int
}
class AtaquesListas:ObservableObject{
    @Published var d: [Ataquesl] = [
        .init(ataque1: "Takle", dano1: 10, ataque2: "Strugle", dano2: 20, ataque3: "Fire Fang", dano3: 30),//FOGO
        .init(ataque1: "Takle", dano1: 10, ataque2: "Techno Blast", dano2: 20, ataque3: "Origin Pulse", dano3: 30),//Agua
        .init(ataque1: "Takle", dano1: 10, ataque2: "Bug bite", dano2: 20, ataque3: "Fire Fang", dano3: 30),//Grass
        .init(ataque1: "Takle", dano1: 10, ataque2: "Fly", dano2: 20, ataque3: "Acrobatics", dano3: 30),//Normal
        .init(ataque1: "Takle", dano1: 10, ataque2: "Strugle", dano2: 20, ataque3: "Fire Fang", dano3: 30)
    ]
}
