//
//  Coredatamanager.swift
//  PokemonDefinitivo
//
//  Created by ricardo on 26/07/2022.
//

import Foundation
import CoreData
class Coredatamanager{
    let presistantcontainer: NSPersistentContainer
    init(){
        presistantcontainer = NSPersistentContainer(name: "")
        presistantcontainer.loadPersistentStores{ (description, error) in if let error = error {
            fatalError("coredata fail")
            }
        }
    }
    func partydosmons() -> [PokemongusCore]{
        let fetchReq: NSFetchRequest<PokemongusCore> = PokemongusCore.fetchRequest()
        do{return try presistantcontainer.viewContext.fetch(fetchReq)}
        catch{
            return []
        }
    }
    func save(title: String){
        let m = PokemongusCore(context: presistantcontainer.viewContext)
        m.nomePoke = title
        do{
            try presistantcontainer.viewContext.save()
        }catch{
            print("Foda-se swift\(error)")
        }
    }
}
