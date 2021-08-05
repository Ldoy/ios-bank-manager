//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()
var bank = Bank()
var bankClerk = BankClerk()

func start() {
    let totalCustomer = bankManager.gatherCustomers()
    var waitLine = bank.makeWaitingLine(from: totalCustomer)
    for _ in 1...totalCustomer {
        let currentQueue = bank.dequeueCustomer(from: &waitLine) ?? 0
        let currentCustomer = Customer(ticketNumber: currentQueue)
        bankClerk.work(for: currentCustomer)
    }
}

func main() {
    let input = bankManager.takeAnswer()
    var flag = true
    while flag {
        guard let input = input else { return }
        switch input {
        case "1":
            start()
            main()
        default:
            flag = false
        }
    }
}

main()
//func main() {
//    var flag = true
//    while flag {
//        let userInput = bankManager.takeAnswer()
//        switch userInput {
//        case BankMenu.open:
//            bankManager.start()
//        case BankMenu.exit:
//            bankManager.end()
//            flag = false
//        default:
//            flag = true
//        }
//    }
//}
//
//main()
