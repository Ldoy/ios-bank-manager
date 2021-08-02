//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/07/27.
//

import Foundation

class Queue<Value> {
    //MARK: Properties
    private var linkedList = LinkedList<Value>()
}

//MARK:-Queue Manage Method
extension Queue {
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func enqueue(_ value: Value) {
        linkedList.append(value)
    }
    
    func dequeue() -> Value? {
        return linkedList.remove()
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Value? {
        return linkedList.glance()
    }
}
