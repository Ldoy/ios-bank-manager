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
    func work(for customer: Customer) {
        let queueNumber = customer.tiketNumber
        let business = customer.business?.rawValue ?? "모르겠어유"
        print("\(queueNumber)번 고객 \(business)업무시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(queueNumber)번 고객 \(business)업무완료")
    }
}
