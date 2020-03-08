//
//  DatabaseProtocol.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/4.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit
import CoreData
protocol DatabaseProtocol {
   
    
    var entityName: String{get set}
    //var bagType : BagProtocol.Type{get}
    
    //typealias type = BagProtocol
    //let bagType: BagProtocol
   // init(entity: String)
//    func insert(item :JSON) -> Bool
//    func search(by key: String,value: Any) -> [NSManagedObject]
//    func remove(by key: String,value: Any) -> Bool
//    func update(by key: String, value: Any,new item: JSON) -> Bool
//    
}
extension DataProtocol{
    //var datas: [bagType]{get}
    
    //var entityName: String = "sld"
   
    
}/*
extension DataProtocol where Self: BagProtocol{
    
    func insert( entityName: String) -> Bool
    
        
}*/
