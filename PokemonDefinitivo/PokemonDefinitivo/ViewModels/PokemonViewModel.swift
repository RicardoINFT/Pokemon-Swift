//
//  PokemonViewModel.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 22/07/2022.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemon = [Pokemon]()
    let baseurl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: baseurl) else{return}
        
        URLSession.shared.dataTask(with: url){(data,response,error) in
            guard let data = data?.parsedata(removeString: "null,") else {return}
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    func bckcolor(forType type: String) -> UIColor{
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemPurple
        case "water": return .systemTeal
        case "electric": return  .systemYellow
        case "psychic": return .systemGray3
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        case "grass" : return .systemGreen
        default: return .systemIndigo
        }
    }
}
extension Data{
    func parsedata(removeString string: String)->Data?{
        let dataasString = String(data: self, encoding: .utf8)
        let parsedataString = dataasString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedataString?.data(using: .utf8)else{return nil}
        return data
    }
}
