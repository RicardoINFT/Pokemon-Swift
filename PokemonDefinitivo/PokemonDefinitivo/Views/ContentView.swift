//
//  ContentView.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 22/07/2022.
//
struct pokemon2{
    var list1 = ["Blastoise", "Ninetales", "Mewtwo"]
    var vida = [100, 95, 110]
    var tipo = ["water","fire","psychic"]
    var url = ["https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2BE319A6-26F5-4FC0-B5D1-4C7B00836F36?alt=media&token=9e243202-6a0f-4917-8665-8bb43423fe57","https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F594705A8-A0B3-4881-8C3E-C7A18995A74B?alt=media&token=69ab7ec5-bcbe-4690-945b-4ad65c4dba89","https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FB6C73244-8B87-45F4-BFA6-456297AFA456?alt=media&token=008666e2-370f-4370-8e34-9511136c9495"]
}

import SwiftUI
import Kingfisher


struct ContentView: View {
    @State var view1 = PartyModel()
    let pokemon : Pokemon
    let coredata = Coredatamanager()
    @State var ss: Double = 0
    @State private var showingPopover = false
    @State private var showwe = false
    let randomInt = Int.random(in: 0...2)
    let viewm : PokemonViewModel
    let back: Color
    init(pokemon: Pokemon,viewm:PokemonViewModel){
        self.pokemon = pokemon
        self.viewm = viewm
        self.back = Color(viewm.bckcolor(forType: pokemon.type))
    }
    var body: some View {
        
        var num = pokenum()
        ZStack{
            
            VStack(alignment: .leading){
               
                Text(pokemon.name.capitalized).font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,8)
                    .padding(.leading)
                    
                HStack{
                    Text(pokemon.type).font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical,8)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.25))
                    )
                        .frame(width: 100,height:24)
                        .frame(width: 100,height: 24)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom,.trailing], 4)
                }.onTapGesture {
                    showingPopover.toggle()
                }.sheet(isPresented: $showingPopover, content: {EmptyView()
                    VStack{
                        ZStack{}
                        Text(pokemon.name.capitalized).bold()
                        Text("Dex N: "+"\(pokemon.id)")
                        HStack{KFImage(URL(string: pokemon.imageUrl))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            .padding([.bottom,.trailing], 4)}.shadow(color: .black, radius: 10)}.padding()
                    VStack{Rectangle().fill().frame(width: 100,height:1)}
                    
        VStack{ Text("- Stats -").bold().padding()}
                   
                    HStack{
                        Text("Vida - ")
                        
                        let cgvida = CGFloat(pokemon.attack-10)
                        if (cgvida<100){
                            Text("\(pokemon.attack-5)")
                            ZStack{
                                RoundedRectangle(cornerRadius:10).fill(.gray).frame(width: 100, height: 10)
                                RoundedRectangle(cornerRadius:10).fill(.green).frame(width: cgvida, height: 10)
                            }
                        }
                        else{
                            Text("100+ ")
                            RoundedRectangle(cornerRadius:10).fill(.green).frame(width: 100, height: 10)
                        }
                    }.padding()
                    HStack{
                    
                        Text("Ataque base - ")
                        
                        let cgataque = CGFloat(pokemon.attack)
                        if(cgataque<100){
                            Text("\(pokemon.attack)")
                            ZStack{RoundedRectangle(cornerRadius:10).fill(.gray).frame(width: 100, height: 10)
                                RoundedRectangle(cornerRadius:10).fill(.red).frame(width: cgataque, height: 10)
                            }
                        }
                        else{
                            Text("100+")
                            RoundedRectangle(cornerRadius:10).fill(.red).frame(width: 100, height: 10)
                        }
                    }.padding()
                    HStack{
                        Text("Peso - ")
                        let peso = CGFloat(pokemon.weight)
                        if (pokemon.weight>100)
                        {
                            Text("100+ ")
                            RoundedRectangle(cornerRadius:10).fill(.orange).frame(width: 100, height: 10)
                        }
                    else{
                            Text("\(pokemon.weight	)")
                        ZStack{
                            RoundedRectangle(cornerRadius:10).fill(.gray).frame(width: 100, height: 10)
                            RoundedRectangle(cornerRadius:10).fill(.orange).frame(width: peso, height: 10)
                        }
                            

                        }
                    }.padding()
                    HStack{
                        Text("Altura - ")
                        Text("\(Double(pokemon.height*10))"+" Cm")
                        }.padding()
                    VStack{Rectangle().fill().frame(width: 100,height:1)}
                    VStack{
                        HStack{
                            VStack{Text("- Descriçao - ").bold().padding()
                                ScrollView{Text(pokemon.description)}.padding()
                            }
                            
                            Text("Lutar!!!").shadow(color: .blue, radius: 10).foregroundColor(.blue).onTapGesture {
                                showwe.toggle()
                            }.sheet(isPresented: $showwe, content: {luta(streak: 0,npcnome: pokemon2().list1[num],npctipo: pokemon2().tipo[num],npcimg: pokemon2().url[num],npcreset: pokemon2().vida[num],npcvida: pokemon2().vida[num],Nome: pokemon.name,danobase: pokemon.attack,Imagem: pokemon.imageUrl, Hp: pokemon.attack-5,peso: pokemon.weight, altura: pokemon.height,tipo: pokemon.type,cor: back, Hpreset: pokemon.attack-5, a1: ataque1(), a1dano: dano())})}
                    }.padding()
                })
            }
        }
        .background(back)
        .cornerRadius(12)
        .shadow(color: back, radius: 6, x: 0.0, y: 0.0)
    }
    func pokenum()-> Int{
        let randomInt = Int.random(in: 0...2)
        return randomInt
    }
    func ataque1()-> String{
        
    switch pokemon.type{
    case "water":
        return "Water gun"
    case "grass":
        return "Cut"
    case "fire":
        return "Fire ball"
    case "poison":
        return "Sting"
    default:
        return "Takle"
        }
    }
    
    func dano()-> Int{
        switch pokemon.type{
        case "water":
            return pokemon.attack-31
        case "grass":
            return pokemon.attack-30
        case "fire":
            return pokemon.attack-32
        case "ghost":
            return pokemon.attack-30
        default:
            return pokemon.attack-30
        }
    }
}


struct s: PreviewProvider {
    static var previews: some View {
        ContentView(pokemon: Pokemon.init(id: 1, name: "Bulba", imageUrl: "", type: "poison", attack: 2, defense: 2, description: "", height: 2, weight: 2), viewm: PokemonViewModel.init())
    }
}
