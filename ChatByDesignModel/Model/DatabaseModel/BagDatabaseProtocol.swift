//
//  BagDatabaseProtocol.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/5.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol BagDatabaseProtocol: BagProtocol,DatabaseProtocol {
    init(entity: String)
}
extension BagDatabaseProtocol{
//    var entityDescription: NSEntityDescription{
//        var appDelete = UIApplication.shared.delegate as! AppDelegate
//        var context = appDelete.persistentContainer.viewContext
//        //var entityName: String = "sld"
//        return
    func insert() -> Bool{
        let appDelete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelete.persistentContainer.viewContext
        let obj = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        //var keys: Array<String> = []
        for j in bag{
            let k = j.0
            let v = j.1.stringValue
            obj.setValue(v, forKey: k)
        }
        do{
            try context.save()
            return true
        }catch{
            print("inser wrong")
            return false
        }
        //return self.insert(item: self.bag)
    }
    func getDatas<T>() -> Array<T> {
        let appDelete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelete.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        var rt : [T] = []
        do{
            let resut = try context.fetch(request)
            for r in resut{
                let rc = r as! T
            
                rt.append(rc)
            }
            
        }catch{
            print("get datas is wrong")
        }
        return rt
    }
    func viewAllFromDatabase(){
        let appDelete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelete.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        do{
            let resut = try context.fetch(request)
            for r in resut{
                //let rc = r as? self
            
                let v = r.value(forKey: "uuid")
                print("VALUE:\(r.value(forKey: "uuid") ?? "nil value")")
            }
            
        }catch{
            print("fetch is wrong")
        }
    }
    func clearAll(){
        let appDelete = UIApplication.shared.delegate as! AppDelegate
               let context = appDelete.persistentContainer.viewContext
               let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        do{
            let resut = try context.fetch(request)
            for r in resut{
                context.delete(r)
                //print("VALUE:\(r.value(forKey: "uuid") ?? "nil value")")
            }
            
        }catch{
            print("dele is wrong")
        }
    }
    
}

