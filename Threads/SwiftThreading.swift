//
//  SwiftThreading.swift
//  Threads
//
//  Created by Saleh Enam Shohag on 3/2/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

import UIKit

class SwiftThreading: NSObject {
    
    func runThread1(){
        DispatchQueue.global().async {
            self.runHeavyTask1()
        }
        print("sync thread called")
//        dispa
        DispatchQueue.global().async {
            self.runHeavyTask2()
        }
    }
    
    func runCustomThread(){
        let concurrentQueue = DispatchQueue.init(label: "com.shohag", attributes: .concurrent)
        concurrentQueue.async {
            self.runHeavyTask1()
        }
        concurrentQueue.async {
            self.runHeavyTask2()
        }
    }
    
    func runCustomThreadSerial(){
        let serialQueue = DispatchQueue.init(label: "com.shohag")
        serialQueue.async {
            self.runHeavyTask1()
        }
        serialQueue.async {
            self.runHeavyTask2()
        }
    }
    
    func runHeavyTask1(){
        for _ in 0...10000 {
            for _ in 0...1000{
                
            }
            print("1")
        }
        
    }
    
    func runHeavyTask2(){
        for _ in 0...10000{
            for _ in 0...1000{
                
            }
            print("2")
        }
    }

}
