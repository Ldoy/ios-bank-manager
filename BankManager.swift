//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var bank = Bank()
}

extension BankManager {
    func takeAnswer() -> String? {
        let question = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(question, terminator: "")
        let input = readLine()
        return input
    }
    
    mutating func letBankWork(_ customer: inout Queue<Int>) {
        self.bank.open(totalCustomer: &customer)
    }
    
    func checkWorkingTime(_ block: () -> ()) -> String {
        let start = Date()
        block()
        let totalTime = Date().timeIntervalSince(start)
        return totalTime.description
    }
    
    func notify(_ total: Int?, _ time: String) {
        bankManager.bank.notifyResult(totalCustomer: total, totalTime: time)
    }

}
