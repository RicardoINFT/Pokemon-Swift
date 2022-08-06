//
//  luta.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 26/07/2022.
//




import SwiftUI
import Kingfisher
struct luta: View {
    @State var streak: Int
    @State var npcnome: String
    @State var npctipo: String
    @State var npcimg: String
    @State var npcreset: Int
    @State var npcvida: Int
    @State var Nome: String
    @State var danobase: Int
    @State var Imagem: String
    @State var Hp: Int
    @State var peso : Int
    @State var altura : Int
    @State var tipo : String
    @State var cor: Color
    @State var Hpreset: Int
    @State var a1: String
    @State var a1dano: Int
    
    var body: some View {
        let Hpbar = CGFloat(Hp)
        let randomInt = Int.random(in: 1...2)
        var Hpbarenimigo = CGFloat(npcvida)
        var enemyreset = npcvida
        var texto = ""
                
            ZStack{
                VStack{
                    if(randomInt==1){Image("back1").frame(width: 500, height:950).padding(10)
                        
                    }
                    else{Image("back1").frame(width: 500, height:950).padding(10)}
                    Rectangle().foregroundColor(.white).frame(width: 1000, height:300)
                    Text("Streak de vitorias contra este pokemon - \(streak) - sem run!")
                    Rectangle().foregroundColor(cor).frame(width: 1000, height:650)
                }
                
                VStack{
                    
                    RoundedRectangle(cornerRadius:10).foregroundColor(.black).opacity(0).frame(width: 170, height: 40).padding(.horizontal,79)
                    HStack{
                        //UI USER
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius:10).foregroundColor(.black).frame(width: 170, height: 90).padding(.horizontal,79)
                                VStack{
                                    Text(Nome.capitalized).foregroundColor(.white)
                                    HStack{Text("Hp:").foregroundColor(.white)
                                        ZStack{
                                            Rectangle().foregroundColor(.gray).frame(width: 100 , height: 14)
                                            Rectangle().foregroundColor(.green).frame(width: Hpbar , height: 14)
                                            Text("\(Hp)%")
                                        }
                                    }
                                }
                            }.shadow(color: .black, radius: 5).padding(-100)
                            KFImage(URL(string: Imagem)).resizable().frame(width: 100, height: 100).padding(.top,40).shadow(color: .black, radius: 10).scaleEffect(x:-1 , y:1)
                        }
                        //Centro dos dois
                        VStack{
                            Rectangle().foregroundColor(.none).opacity(0).frame(width: 100, height: 100)
                        }
                        //UI ADVERSARIO
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius:10).foregroundColor(.black).frame(width: 170, height: 90)
                                VStack{
                                    Text(npcnome).foregroundColor(.white)
                                    HStack{
                                        ZStack{
                                            Rectangle().foregroundColor(.gray).frame(width: 100 , height: 14)
                                            Rectangle().foregroundColor(.green).frame(width: Hpbarenimigo , height: 14)
                                            Text("\(npcvida)%")
                                        }
                                        Text(":Hp").foregroundColor(.white)
                                    }
                                }
                            }.shadow(color: .black, radius: 5).padding(-100)
                            KFImage(URL(string: npcimg)).resizable().frame(width: 100, height: 100).padding(.top,40).shadow(color: .black, radius: 10)
                        }
                    }
                    //ataques
                    Rectangle().foregroundColor(.red).opacity(0).frame(width: 100, height: 100).padding(10)
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius:10).foregroundColor(.gray).frame(width: 150, height: 100).onTapGesture {
                                danocalc()
                            npcvida = Int(npcvida-a1dano)
                                acabar()
                                danonpc()
                                acabar()
                        }.shadow(color: .black, radius: 10)
                            VStack{
                                Text(a1)
                                Text("Dano - \(a1dano)")
                            }
                        }
                        Rectangle().foregroundColor(.red).opacity(0).frame(width: 10, height: 100)
                        ZStack{
                            RoundedRectangle(cornerRadius:10).foregroundColor(.gray).frame(width: 150, height: 100).onTapGesture {
                                
                            npcvida = npcvida-(danobase-30)
                                acabar()
                                danonpc()
                                acabar()
                        }.shadow(color: .black, radius: 10)
                            VStack{
                                Text("Origin pulse")
                                Text("Dano - \(danobase-30)")
                                
                            }
                        }
                    }.padding(10)
                    HStack{
                        ZStack{RoundedRectangle(cornerRadius:10).foregroundColor(.gray).frame(width: 150, height: 100).onTapGesture {
                            texto = "Utilizaste - Quick attack"
                            npcvida = npcvida-(danobase/9)
                            acabar()
                                danonpc()
                                acabar()
                        }.shadow(color: .black, radius: 10)
                            VStack{
                                Text("Quick attack")
                                Text("Dano - \(danobase/9)")
                            }
                        }
                        Rectangle().foregroundColor(.green).opacity(0).frame(width: 10, height: 100)
                        ZStack{RoundedRectangle(cornerRadius:10).foregroundColor(.blue).frame(width: 150, height: 100).onTapGesture {
                            
                        }.shadow(color: .black, radius: 10)
                            VStack{Text("Drop down to run!")
                            }
                        }.navigationBarTitle("asd3")
                    }.navigationBarTitle("asd2")
                }.navigationBarTitle("asd1")
                Rectangle().frame(width: 1000, height: 50).foregroundColor(.black)
                Text(texto)
            }.navigationBarTitle("asd5")
    }
    
    func danonpc(){
    
    switch npcnome{
    case "Mewtwo":
        let randomInt = Int.random(in: 20...45)
        Hp = Hp-randomInt
        print(randomInt)
        print(a1dano)
    case "Blastoise":
        let randomInt = Int.random(in: 20...35)
        Hp = Hp-randomInt
        print(randomInt)
        print(a1dano)
    case "Ninetales":
        let randomInt = Int.random(in: 5...15)
        Hp = Hp-randomInt
        print(randomInt)
        print(a1dano)
        default: "sad"
            }
    }
    
    func danocalc(){
        switch a1{
        case "Water gun":
            if npctipo == "water"
            {return a1dano = 0}
            if npctipo == "poison"
            {return a1dano = a1dano + 30}
        case "Cut":
            if npctipo == "grass"
            {return a1dano = 0}
            if npctipo == "water"
            {return a1dano = a1dano + 30}
        case "Fire ball":
            if npctipo == "fire"
            {return a1dano = 0}
            if npctipo == "grass"
            {return a1dano = a1dano + 30}
        case "Sting":
            if npctipo == "poison"
            {return a1dano = 0}
            return a1dano += 10
        default:
            return a1dano = a1dano
        }
    }
    
    func acabar(){
        if(npcvida <= 0)
        {
            streak = streak + 1
            Hp = Hpreset
            npcvida = npcreset
            print("Ganhaste")
        }
        if(Hp <= 0)
        {
            streak = 0
            Hp = Hpreset
            npcvida = npcreset
            print("Perdeste")
        }
    }
}
