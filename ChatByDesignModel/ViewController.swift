//
//  ViewController.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import UIKit
import SwiftyJSON
import CocoaAsyncSocket
func viewBag(bag: BagProtocol){
    print(bag.bag.debugDescription)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // TestData td
        let infos = ClientInfos()
        infos.clearAll()
        let info = ClientInfo(newname: "ro", nick: "lodestar", pass_word: "801103")
        let info2 = ClientInfo(newname: "yang", nick: "jinglan", pass_word: "840328")
        infos.insert(item: info)
        infos.insert(item: info2)
        infos.viewAllFromDatabase()
        let re = infos.search(by: "name", equal: "ro")
        /*let db = Database<TestData>(entityName: "Test")
        let t = TestData(uid: "ro")
        let t2 = TestData(uid: "2")
        let t3 = TestData(uid: "3")
        db.clearAll()
        db.insert(item: t)
        db.insert(item: t2)
        db.insert(item: t3)
        var datas = db.getDatas { (rt) -> TestData? in
            
            if let v = rt.value(forKey: "uuid") as? String
            {
                return  TestData(uid: v)
            }
            else
            {
                return nil
            }
            
        }
        db.viewAllFromDatabase(viewMethod: { (result) in
            let v = result.value(forKey: "uuid") as! String
            print("uuid:\(v)")
        })
           
        */
        var server = ServerInfo()
        //viewBag(bag: server)
        server.setServerInfo(name: "rolodestar", nick_name: "server")
        //viewBag(bag: server)
        
        
        let client = ClientInfo(newname: "rolode", nick: "hadsome", pass_word: "123456")
        let body = TextBody(text: "hi server", sender: client.uuid, reciver: server.uuid)
        
        let b2 = ImageBody(image: UIImage(named: "2")!, sender: client.uuid, reciver: server.uuid)
        let msg = Message(by: b2)
        //viewBag(bag: b2)
        //viewBag(bag: msg.head)
        var json = JSON()
        json = [client.bag,client.bag,server.bag]
        let cmd = CommandBody(command_name: "login", command_type: "request", command_detail: json, sender: client.uuid, reciver: server.uuid)
        viewBag(bag: cmd)
        var ib = ImageBody()
        ib.fromData(by: b2.toData()!)
        let i = ib.image
       
        let s = 1
        
    }


}

