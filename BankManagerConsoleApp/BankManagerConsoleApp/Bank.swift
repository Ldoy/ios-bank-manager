//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
//    var clerkNumber: Int = 1
    var bankClerk = BankClerk()
    // customerQueue를 바깥에 만들어놔야 나중에 추가할 때 새로운 Queue를 만들지 않을 수 있을 것 같습니다!
    var customerQueue = Queue<Int>()
    var customer = Customer()
}

extension Bank {
    mutating func makeWaitingLine() {
        for customerNumber in 1...customer.totalCustomer {
            customerQueue.enqueue(customerNumber)
        }
    }
    
    mutating func open() {
        var customerInCharge =  customerQueue.dequeue()
        for _ in 1...customer.totalCustomer {
            self.bankClerk.work(withcustomer: customerInCharge)
        }
    }

    // open 메소드가 있으니 close라고 하는 것이 더욱 가독성 측면으로 좋지 않을까 생각해 수정해보았습니다.
    mutating func notifyClosing(totalCustomer: Int?, totalTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
