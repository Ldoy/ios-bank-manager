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
//            bankManager.
//            bankManager.bank.open(totalCustomer: <#T##Int#>)
        } else {
            flag = false
        }
    }
}

main()
