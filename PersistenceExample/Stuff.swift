//
//  Stuff.swift
//  SimplePersistenceExample
//
//  Created by Jason Hoffman on 5/28/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class Stuff: NSObject, NSCoding {
    
    var stuffName: String?
    var stuffImage: UIImage?
    
//    // for NSKeyedUnarchiver
//    override init() {
//        super.init()
//    }
//    
    init(stuffName: String, stuffImage: UIImage) {
        self.stuffName = stuffName
        self.stuffImage = stuffImage
    }
    
    required init(coder aDecoder: NSCoder) {
        self.stuffName = aDecoder.decodeObjectForKey("stuffName") as? String
        self.stuffImage = aDecoder.decodeObjectForKey("stuffImage") as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.stuffName, forKey: "stuffName")
        aCoder.encodeObject(self.stuffImage, forKey: "stuffImage")
    }
}
