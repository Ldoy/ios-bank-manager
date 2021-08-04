//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

func main() {
    var flag = true
    var bank = Bank()
    var queue = bank.makeWaitingLine(from: 10)
    let group = DispatchGroup()
    let runLoanQueue = DispatchQueue.init(label: "loan")
    let runSaveQueue = DispatchQueue.global()
    let mainQueue = DispatchQueue.main
    var totalTime = ""
    var totalCustomer = 0
    let userInput = bankManager.takeAnswer()
    
    while flag {
        switch userInput {
        case BankMenu.open:
            bankManager.start(&queue, group: group, runSaveQueue: runSaveQueue, runLoanQueue: runLoanQueue)
        case BankMenu.exit:
            bankManager.end()
            flag = false
        default:
            flag = true
        }
    }

//    group.notify(queue: mainQueue) {
//        bankManager.showWorkResult(totalCustomer, totalTime)
//    }
}

main()
