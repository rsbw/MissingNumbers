//
//  AppDelegate.swift
//  MissingNumbers
//
//  Created by Sergey Sergeyev on 2/3/17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let sequences = [
            [1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30], // 3, 25
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,17,18,19,20,21,22,23,24,25,26,27,28,29,30],  // 15, 16
            [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,29,30], // 1, 18
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,25,26,27,28,29,30],  // 23, 24
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30], // 19
            [1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,30],   // 13, 20
            [1,2,3,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], // 4, 9
            [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30],  // 9, 29
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], // ---
            [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],   // 1, 2
        ]

        for sequence in sequences {
            
            let numbers = Numbers(sequence: sequence)
            let missing = numbers.find2Missing()
            
            print("missing: \(missing)")
        }
        
        NSApplication.shared().terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

