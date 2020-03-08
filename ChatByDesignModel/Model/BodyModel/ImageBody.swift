//
//  ImageBody.swift
//  ChatByDesignModel
//
//  Created by rolodestar on 2020/1/30.
//  Copyright © 2020 Rolodestar Studio. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct ImageBody: BodyProtocol {
    mutating func appendValueFromJson() {
        self.image = UIImage()
        if let str = self.bag["image"].string{
            if let data = Data(base64Encoded: str){
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
    }
    
    mutating func appendJsonFromValue() {
        
        if let data = image.pngData(){
            
            let str = data.base64EncodedString()
             bag["image"].string = str
        }
        else{
            bag["image"].string = nil
        }
    }
    
    var type: String = "image"
    
    var sender: String
    
    var reciver: String
    
    var uuid: String = UUID().uuidString
    
    var bag: JSON = JSON()
    var image: UIImage
    init(){
        image = UIImage()
        sender = ""
        reciver = ""
        //uuid = UUID().uuidString
        setBag()
    }
    init(image msg: UIImage,sender s: String,reciver r: String){
        image = msg
        sender = s
        reciver = r
        //uuid = UUID().uuidString
        setBag()
        
        
    }
    
    
    
}
