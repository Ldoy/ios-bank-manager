//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    var tiketNumber: Int
    var business: String?
    
    enum Business: String, CaseIterable {
        case loan
        case save
    }
    
    init(ticketNumber: Int) {
        self.business = Business.allCases.randomElement()?.rawValue
        self.tiketNumber = ticketNumber
    }
}
