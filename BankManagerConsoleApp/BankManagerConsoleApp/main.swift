//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

func main() {
    var flag = true
    while flag == true {
        if bankManager.takeAnswer() == "1" {
            var bank = Bank()
            let totalCustomer = Customer().totalCustomer
            var waitingLine = bank.makeWaitingLine(totalCustomer)
            bank.workResult(totalCustomer: totalCustomer, totalTime: timeCheck {
                bank.open(totalCustomer: &waitingLine)
            })
        } else {
            flag = false
        }
    }
}

main()
