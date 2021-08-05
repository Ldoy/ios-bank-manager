//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    enum BankingBusiness: String, CaseIterable {
        case loan = "대출"
        case deposit = "예금"
        
        var task: String {
            self.rawValue
        }
    }
    
    var ticketNumber: Int
    var business: String
    
    init(ticketNumber: Int) {
        self.ticketNumber = ticketNumber
        business = BankingBusiness.allCases.randomElement()!.task
    }
}
