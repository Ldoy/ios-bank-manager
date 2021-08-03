//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    private var bankClerk = BankClerk()
}

extension Bank {
    mutating func makeWaitingLine(_ totalCustomer: Int) -> Queue<Int> {
        var waitingLine = Queue<Int>()
        for i in 1...totalCustomer {
            waitingLine.enqueue(i)
        }
        return waitingLine
    }
    
    mutating func letClerkWork(with customerLine: inout Queue<Int>) {
        while customerLine.isEmpty() == false {
            let currentCustomer = customerLine.peek()
            customerLine.dequeue()
            bankClerk.work(with: currentCustomer ?? .zero)
        }
    }

    mutating func notifyResult(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
