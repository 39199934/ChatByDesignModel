//
//  DatabaseDelegate.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/3/6.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import CoreData
protocol DatabaseDelegate {
//    associatedtype type
    func databaseGetDatasFromObjects<T>(result: [NSManagedObject])-> [T]?
    func databaseViewDatas(result: NSManagedObject)
    func databaseInsertValueToDatabase<T>(instans: T,obj: NSManagedObject ) ->Bool
}
