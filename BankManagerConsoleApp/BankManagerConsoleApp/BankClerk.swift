//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct BankClerk {
}

extension BankClerk {
    // 메서드를 하나로 하는게 날까, 2개로 하는게 날까?
    func work(for customer: Int?, of task: String, during time: Double) {
        guard let customerNumber = customer else {
            return
        }
        print("\(customerNumber)번 고객 \(task)업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(customerNumber)번 고객 \(task)업무 완료")
    }
    
    func handleLoan(for customer: Int?) {
        guard let customerNumber = customer else {
            return
        }
        print("\(customerNumber)번 고객 대출업무 시작")
        Thread.sleep(forTimeInterval: 1.1)
        print("\(customerNumber)번 고객 대출업무 완료")
    }
    
    func handleDeposit(for customer: Int?) {
        guard let customerNumber = customer else {
            return
        }
        print("\(customerNumber)번 고객 예금업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customerNumber)번 고객 예금업무 완료")
    }
}
