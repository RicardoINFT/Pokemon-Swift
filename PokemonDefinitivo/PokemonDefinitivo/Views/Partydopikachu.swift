//
//  Partydopikachu.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 26/07/2022.
//

import SwiftUI

struct Partydopikachu: View {
    @State var viewmodel = PartyModel()
    var body: some View {
        NavigationView{
             VStack{
                List{
                    ForEach(viewmodel.s){st in
                        row(Nome: st.nome)
                    }
                }
            }.navigationTitle("Party")
                .navigationViewStyle(.stack)
        }
    }
    
}
struct row: View{
    let Nome: String
    var body: some View{
        Label(
            title: {Text(Nome)},
            icon: {Image(systemName: "chart.bar")}
        )
    }

}



