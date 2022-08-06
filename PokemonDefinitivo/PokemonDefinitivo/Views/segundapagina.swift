//
//  segundapagina.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 06/08/2022.
//

import SwiftUI

struct segundapagina: View {
    var body: some View {
        NavigationView{
        NavigationLink(destination: EmptyView()) {
            Text("BATALHAR!")
                .cornerRadius(5)
                .foregroundColor(Color.red)
                .font(.title2)
            }
        }
    }
}

struct segundapagina_Previews: PreviewProvider {
    static var previews: some View {
        segundapagina()
    }
}
