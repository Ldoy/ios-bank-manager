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
            let totalCustomer = Customer().totalCustomer
            var waitingLine = bankManager.bank.makeWaitingLine(totalCustomer)
            let workTime = bankManager.checkWorkingTime {
                bankManager.letBankWork(&waitingLine)
            }
            bankManager.notify(totalCustomer, workTime)
        } else {
            flag = false
        }
    }
}

main()
