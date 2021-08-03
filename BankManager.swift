//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank = Bank()
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
    
    func gatherCustomers() -> Int {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        return totalNumber
    }
    
    mutating func openBank(_ customer: inout Queue<Int>) {
        self.bank.work(customerLine: &customer)
    }
    
    func checkWorkingTime(_ block: () -> ()) -> String {
        let start = Date()
        block()
        let totalTime = Date().timeIntervalSince(start)
        return totalTime.description
    }
    
    func showWorkResult(_ total: Int, _ time: String) {
        bankManager.bank.notifyResult(totalCustomer: total, totalTime: time)
    }
    
    mutating func makeWaitingLine(from totalcustomer: Int) -> Queue<Int>{
        return bank.makeWaitingLine(totalcustomer)
    }
    
}
