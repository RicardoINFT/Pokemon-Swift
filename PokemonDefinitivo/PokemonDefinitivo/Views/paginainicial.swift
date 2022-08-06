//
//  paginainicial.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 06/08/2022.
//

import SwiftUI

struct paginainicial: View {
    var body: some View {
        NavigationView{
        ZStack{
        ZStack{
            Rectangle().foregroundColor(.black).frame(width: 1000, height: 10000)
        HStack{
            Rectangle().foregroundColor(.red)
            Rectangle().foregroundColor(.white)
            }
            Circle().foregroundColor(.black).frame(width: 100, height: 100)
            Circle().foregroundColor(.white).frame(width: 80, height: 80)
            Circle().foregroundColor(.black).frame(width: 60, height: 60)
            Circle().foregroundColor(.white).frame(width: 40, height: 40)
            }
            VStack{
                Image("logo").resizable().frame(width: 400, height:200)
            ZStack{
            Rectangle().foregroundColor(.black).frame(width: 300, height: 300).opacity(0.8)
                VStack{
                Text("Este jogo tem como seu principal\nobjetivo o ser o suficiente para ter\numa nota minimamente decente a\nswift. \nO simulador possui uma simples \nsimulação de batalhas entre \nPokemons.\n"
                ).foregroundColor(.white)
                    NavigationLink(destination: Pokedexview()) {
                        Text("Ir para a Pokedex!")
                            .foregroundColor(Color.blue).shadow(color: .blue, radius: 10)
                            }
                }.padding(100)
                    }
                }
            }
        }
    }
}

struct paginainicial_Previews: PreviewProvider {
    static var previews: some View {
        paginainicial()
    }
}
