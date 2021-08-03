//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

func main() {
    enum BankMenu {
        static let open = "1"
        static let exit = "2"
    }
    
    var flag = true
    while flag == true {
        let answer = bankManager.takeAnswer()
        switch answer {
        case BankMenu.open:
            let totalCustomers = bankManager.gatherCustomers()
            bankManager.formWaitingLine(from: totalCustomers)
            let workTime = bankManager.checkWorkingTime {
                bankManager.openBank()
            }
            bankManager.showWorkResult(totalCustomers, workTime)
        case BankMenu.exit:
            flag = false
        default:
            flag = true
        }
    }
}

main()
