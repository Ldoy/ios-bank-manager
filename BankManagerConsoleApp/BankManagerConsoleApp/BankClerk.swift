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
    func work(withcustomer tagNumber: Int?) {
        guard let tagNumber = tagNumber else {
            return
        }
        print("\(tagNumber)번 고객 업무시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(tagNumber)번 고객 업무완료")
    }
}
