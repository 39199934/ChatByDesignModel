//
//  ClientInfos.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/7.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class ClientInfos:Database<ClientInfo>{
    init(){
        super.init(entityName: "ClientInfoDatabase")
        delegate = self
    }
    
}

extension ClientInfos:DatabaseDelegate{
    func databaseGetDatasFromObjects<T>(result: [NSManagedObject]) -> [T]? {
        var rtClasss : [ClientInfo] = []
        for re in result{
            let n = re.value(forKey: "name") as? String ?? ""
            let nick = re.value(forKey: "nickName") as? String ?? ""
            let password = re.value(forKey: "password") as? String ?? ""
            let uuid = re.value(forKey: "uuid") as? String ?? ""
            let rt  = ClientInfo(newname: n, nick: nick, pass_word: password,new_uuid: uuid)
            rtClasss.append(rt)
            
        }
        return rtClasss as? [T]
    }
    
    func databaseViewDatas(result re: NSManagedObject) {
        let n = re.value(forKey: "name") as? String ?? ""
        let nick = re.value(forKey: "nickName") as? String ?? ""
        let password = re.value(forKey: "password") as? String ?? ""
        let uuid = re.value(forKey: "uuid") as? String ?? ""
        let rt  = ClientInfo(newname: n, nick: nick, pass_word: password,new_uuid: uuid)
        print(rt.bag.dictionaryValue)
    }
    
    func databaseInsertValueToDatabase<T>(instans: T, obj: NSManagedObject) -> Bool {
        //let info = instans as! ClientInfo
        let info = instans as! ClientInfo
        
        obj.setValue(info.name, forKey: "name")
        obj.setValue(info.nickName, forKey: "nickName")
        obj.setValue(info.password, forKey: "password")
        obj.setValue(info.uuid, forKey: "uuid")
        return true
    }
    
    
}
