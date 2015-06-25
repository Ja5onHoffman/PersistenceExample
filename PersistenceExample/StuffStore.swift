//
//  StuffStore.swift
//  SimplePersistenceExample
//
//  Created by Jason Hoffman on 5/28/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class StuffStore: NSObject {
    
    var stuffArray = [Stuff]()
    static let sharedStore = StuffStore()
    
    override init() {
        super.init()
        let path = self.documentsDirectory()
        if let ar = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Stuff] {
            self.stuffArray = ar
        }
    }
    
    func createStuff(stuffName: String, stuffImage: UIImage) {
        let stuff = Stuff(stuffName: stuffName, stuffImage: stuffImage)
        self.stuffArray.append(stuff)
    }
    
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingPathComponent("stuff.file") as String
        
        return documentsFolderPath
    }
    
    func allStuff() -> [Stuff] {
        return self.stuffArray
    }
    
    func saveStuff() {
        let path = documentsDirectory()
        println("save: \(path)")
        NSKeyedArchiver.archiveRootObject(self.stuffArray, toFile: path)
    }
    
    func deleteMeme(atIndex index: Int) {
        self.stuffArray.removeAtIndex(index)
    }
}