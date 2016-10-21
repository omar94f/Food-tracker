//
//  Meal.swift
//  Food tracker
//
//  Created by Omar Farooq on 10/18/16.
//  Copyright © 2016 Omar. All rights reserved.
//

import UIKit

class Meal : NSObject{
    var name: String
    var photo: UIImage?
    
    static var DocumentsDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    static let ArchivalURL = DocumentsDirectory.appendPathComponent("meals")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey =  "photo"
    }
    //var rating
    init?(name: String, pic: UIImage){
        self.name = name
        self.photo = pic
        
        super.init()
        
        if(name.isEmpty){
            return nil
        }
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as! UIImage
        
        self.init(name: name, pic: photo)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.nameKey)
        
    }
}
