//
//  Database.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/6.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class Database<BAGT> where BAGT: BagProtocol{
    var entityName: String = ""
    var  delegate: DatabaseDelegate?
    lazy var appDelete : AppDelegate  = UIApplication.shared.delegate as! AppDelegate
    lazy var context: NSManagedObjectContext = appDelete.persistentContainer.viewContext
    var databaseDatas: [NSManagedObject]?{
        do{
            //var result : Array<T> = []
            let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
            let rtData = try context.fetch(request)
            return rtData
            
        }catch{
            print("get datas is wrong")
            return nil
        }
    }
    init(entityName : String){
        self.entityName = entityName
        //self.delegate = delegate
        
    }
    func search(by key: String,equal value: Any) -> [BAGT]{
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        var per: NSPredicate
        if (value is Int){
            per = NSPredicate(format: "\(key) == %@", NSNumber(value: value as! Int))
            request.predicate = per
        }
        if (value is String){
            per = NSPredicate(format: "\(key) == %@", value as! String)
            request.predicate = per
        }
        
        
        do{
            let result = try context.fetch(request)
            //let rtdatas = (delegate?.databaseGetDatasFromObjects(result: result)) as? Array<BAGT>
            return delegate?.databaseGetDatasFromObjects(result: result) ?? []
        }catch{
            print("get datas is wrong")
            return []
        }
        
    }
    func insert(item: BAGT) -> Bool{
       
        //let obj = NSEntityDescription.insertNewObject<NSManagedObject>(forEntityName: entityName, into: context)
//        let appDelete : AppDelegate  = UIApplication.shared.delegate as! AppDelegate
//        let  context: NSManagedObjectContext = appDelete.persistentContainer.viewContext
        //NSEntityDescription.
        let obj = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        delegate?.databaseInsertValueToDatabase(instans: item, obj: obj)
        do{
            try context.save()
            return true
        }catch{
            print("inser wrong")
            return false
        }
        //return self.insert(item: self.bag)
    }
  
    func getDatas() ->Array<BAGT>{
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
       
        
        do{
            let result = try context.fetch(request)
            //let rtdatas = (delegate?.databaseGetDatasFromObjects(result: result)) as? Array<BAGT>
            return delegate?.databaseGetDatasFromObjects(result: result) ?? []
        }catch{
            print("get datas is wrong")
            return []
        }
        
       
    }
   func getDatas<F>(getMethod: (NSManagedObject)-> F?) ->Array<F>{
       
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        //var rt : [T] = []
        do{
            var result : Array<F> = []
            let rtData = try context.fetch(request)
            for r   in rtData{
                if let cc = getMethod(r){
                    result.append(cc)
                }
                
                
            }
            return result
            
        }catch{
            print("get datas is wrong")
            return []
        }
        return []
    }
   
    func viewAllFromDatabase(){
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        do{
            let resut = try context.fetch(request)
            
            for r in resut{
                delegate?.databaseViewDatas(result: r)
            }
            
            
            
            
        }catch{
            print("fetch is wrong")
        }
    }
    func viewAllFromDatabase(viewMethod: (NSManagedObject) -> Void){
       
        let request = NSFetchRequest<NSManagedObject>.init(entityName: entityName)
        do{
            let resut = try context.fetch(request)
            //let ds = T.
            //if let dst = resut as? [T] {
            
            //let keys = T.getStoredKeys()
           
            //let keys = T.getStoredKeys(T.self)
            for r in resut{
                viewMethod(r)
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
