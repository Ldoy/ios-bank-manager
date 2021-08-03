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
    
    func open() {
        customer.goToBank(of: customerQueue)
        // open 메소드 안에 들어가야하는가? 콘솔앱에서 실행해야하는가?
        bankClerk.handleTask(of: customerQueue, customer.customerNumber)
    }
    
    // 업무 처리 고객과 업무시간을 매개변수로 받아 console에서 결정할 것이냐, Bank가 알고있도록 Bank의 프로퍼티로 만들 것이냐
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
