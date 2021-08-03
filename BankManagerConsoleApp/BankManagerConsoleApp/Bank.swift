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
}

extension Bank {
    mutating func makeWaitingLine(_ totalCustomer: Int) -> Queue<Int> {
        var waitingLine = Queue<Int>()
        for i in 1...totalCustomer {
            waitingLine.enqueue(i)
        }
        return waitingLine
    }
    
    mutating func open(totalCustomer: inout Queue<Int>) {
//        guard let customer = waitingLine.dequeue() else { return }
//        for _ in 1...totalCustome {
//            self.bankClerk.work(with: customer)
//        }
        
        while totalCustomer.isEmpty() == false {
            bankClerk.work(with: totalCustomer.dequeue())
        }
    }

    mutating func workResult(totalCustomer: Int?, totalTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
