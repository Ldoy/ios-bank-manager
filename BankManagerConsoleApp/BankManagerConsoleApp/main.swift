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
            var waitingLine = bankManager.formWaitingLine(from: totalCustomer)
            let workTime = bankManager.checkWorkingTime {
                bankManager.openBank(&waitingLine)
            }
            bankManager.showWorkResult(totalCustomer, workTime)
        } else {
            flag = false
        }
    }
}

main()
