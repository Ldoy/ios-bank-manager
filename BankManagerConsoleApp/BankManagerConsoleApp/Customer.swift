//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    var totalCustomer: Int
    
    init() {
        let range = (10...30)
        let totalCustomer = Int.random(in: range)
        self.totalCustomer = totalCustomer
    }
    
    init(totalCustomer: Int) {
        self.totalCustomer = totalCustomer
    }
}
