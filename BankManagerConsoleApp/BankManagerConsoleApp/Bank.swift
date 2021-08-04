//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    private var bankClerk = BankClerk()
//    private var waitingLine = Queue<Int>()
}

extension Bank {
    mutating func makeWaitingLine(from totalCustomerNumber: Int) -> Queue<Int> {
        var queue = Queue<Int>()
        for i in 1...totalCustomerNumber {
            queue.enqueue(i)
        }
        return queue
    }
    
    mutating func giveCustomer(_ queue: inout Queue<Int>) -> Int? {
        defer { queue.dequeue() }
        return queue.peek()
    }
    
    mutating func letClerkWork(_ queue: inout Queue<Int>, group: DispatchGroup, runSaveQueue: DispatchQueue, runLoanQueue: DispatchQueue) {
            guard let customerTiketNumber = giveCustomer(&queue) else { return }
            let currentCustomer = Customer(ticketNumber: customerTiketNumber)
//            bankClerk.work(for: currentCustomer)
        bankClerk.work2(for: currentCustomer, group: group, runLoanQueue: runLoanQueue, runSaveQueue: runSaveQueue)
    }
    
    mutating func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
