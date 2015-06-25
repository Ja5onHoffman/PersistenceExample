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
    // sharedStore is a singleton, which is much
    // easier to crate in Swift
    static let sharedStore = StuffStore()
    
    override init() {
        super.init()
        // Get path
        let path = self.documentsDirectory()
        // Unararchive array of previously created 'stuff'.
        // Can be unarchived because Stuff objects conform to
        // NSCoding protocol
        if let ar = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Stuff] {
            self.stuffArray = ar
        }
    }
    
    // Create a new stuff and add it to stuffArray
    func createStuff(stuffName: String, stuffImage: UIImage) {
        let stuff = Stuff(stuffName: stuffName, stuffImage: stuffImage)
        self.stuffArray.append(stuff)
    }
    
    func documentsDirectory() -> String {
        // NSURLs can also be used for the purpose of getting a filepath
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingPathComponent("stuff.file") as String
        
        return documentsFolderPath
    }
    
    func allStuff() -> [Stuff] {
        return self.stuffArray
    }
    
    func saveStuff() {
        let path = documentsDirectory()
        println("save: \(path)")
        // Each Stuff object conforms to NSCoding, so can be archived
        // using NSKeyedArchiver
        NSKeyedArchiver.archiveRootObject(self.stuffArray, toFile: path)
    }
    
    func deleteMeme(atIndex index: Int) {
        self.stuffArray.removeAtIndex(index)
    }
}