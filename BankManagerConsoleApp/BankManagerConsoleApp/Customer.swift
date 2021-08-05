//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation
enum Business: String, CaseIterable {
    case 대출, 예금
    case etc
}

struct Customer {
    var tiketNumber: Int
    var business: Business?
    
    init(ticketNumber: Int) {
        self.tiketNumber = ticketNumber
        self.business = Business.allCases.randomElement()
    }
}
