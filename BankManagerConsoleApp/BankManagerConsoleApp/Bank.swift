//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    let bankClerk = BankClerk()
    let customer = Customer()
    let customerQueue = Queue<Int>()
}

extension Bank {
    func open() {
        customer.goToBank(of: customerQueue)
        bankClerk.handleTask(of: customerQueue, customer.customerNumber)
    }
    
    func close() {
        if customerQueue.isEmpty() {
//            let taskTime = calculateTaskTime()
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.customerNumber)명이며, 총 업무시간은 \(Double(customer.customerNumber) * 0.70)초입니다.")
        }
    }
    
    //    func calculateTaskTime() -> Double {
    //        let start = CFAbsoluteTimeGetCurrent()
    //        open()
    //        let diff = CFAbsoluteTimeGetCurrent() - start
    //
    //        return diff
    //    }
}
