//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Customer {
    let customerNumber = Int.random(in: 10...30)
    
    func goToBank(of customer: Queue<Int>) {
        for i in 1...customerNumber {
            customer.enqueue(i)
        }
    }
}
