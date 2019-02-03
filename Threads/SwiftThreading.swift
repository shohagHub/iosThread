//
//  SwiftThreading.swift
//  Threads
//
//  Created by Saleh Enam Shohag on 3/2/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

import UIKit

class SwiftThreading: NSObject {
    /*
     Difference between sync and async call
      ->when async is called the line after the thread call
      will immendiately executed.
      ->when sync is called the line after the thread call will be executed
     when thread finishes it's job
     */
    
    func runThread1(){
        DispatchQueue.global().async {
            self.runHeavyTask1()
        }
        print("sync thread called")
//        dispa
        DispatchQueue.global().async {
            self.runHeavyTask2()
        }
//        DispatchQueue.global(qos: .background)
    }
    
    func runCustomQueueThreadConcurrent(){
        let concurrentQueue = DispatchQueue.init(label: "com.shohag", attributes: .concurrent)
        concurrentQueue.async {
            self.runHeavyTask1()
        }
        concurrentQueue.async {
            self.runHeavyTask2()
        }
    }
    
    func runCustomQueueThreadSerial(){
        let serialQueue = DispatchQueue.init(label: "com.shohag")
        serialQueue.async {
            self.runHeavyTask1()
        }
        serialQueue.async {
            self.runHeavyTask2()
            
        }
    }
    
    func runCustomQueueWithAllParam(){
        let queue = DispatchQueue.init(label: "com.shoag", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        queue.async {
            self.runHeavyTask1()
        }
        queue.async {
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
