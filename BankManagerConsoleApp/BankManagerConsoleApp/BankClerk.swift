//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation


struct BankClerk {
}

extension BankClerk {
    func handleTask(of customer: Queue<Int>, _ customerNumber: Int) {
        for i in 1...customerNumber {
            print("\(i)번 고객 업무 시작")
            customer.dequeue()
            Thread.sleep(forTimeInterval: 0.1)
            print("\(i)번 고객 업무 완료")
        }
    }
}
