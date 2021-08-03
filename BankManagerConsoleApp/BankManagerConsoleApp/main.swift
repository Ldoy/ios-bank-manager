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
//            let totalCustomer = Customer().totalCustomer
            let totalCustomers = bankManager.gatherCustomers()
            var waitingLine = bankManager.makeWaitingLine(from: totalCustomers)
            let workTime = bankManager.checkWorkingTime {
                bankManager.openBank(&waitingLine)
            }
            bankManager.showWorkResult(totalCustomers, workTime)
        } else {
            flag = false
        }
    }
}

main()
