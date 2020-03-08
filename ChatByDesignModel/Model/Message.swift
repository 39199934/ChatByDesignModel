//
//  Message.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

struct Message{
    var head: MessageHead
    var body: BodyProtocol
    init(head: MessageHead,body: BodyProtocol){
        self.head = head
        self.body = body
    }
    init(by body: BodyProtocol){
        self.head = MessageHead(version: "1.0", size: body.size)
           
        self.body = body
    }
    func send(socket: GCDAsyncSocket){
        guard let queue = socket.delegateQueue else{
            return
        }
        queue.async {
            socket.write(self.head.toData() ?? Data(), withTimeout: -1, tag: self.head.uuid.hashValue)
            sleep(200)
            socket.write(self.body.toData() ?? Data(), withTimeout: -1, tag: self.head.uuid.hashValue)
        }
    }
}
