//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

class Bank {
    private var bankClerk = BankClerk()
    private var waitingLine = Queue<Customer>()
}

extension Bank {
    func makeWaitingLine(from totalCustomerNumber: Int) {
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    func letClerkWork() {
        let semaphore = DispatchSemaphore(value: 2)
        
        while waitingLine.isEmpty() == false {
            guard let currentCustomer = waitingLine.peek() else {
                return
            }
            waitingLine.dequeue()
            
            switch currentCustomer.business {
            case "대출":
                let loanQueue = DispatchQueue(label: "대출업무")
                loanQueue.async {
                    self.bankClerk.handleLoan(for: currentCustomer.ticketNumber)
                }
            case "예금":
                semaphore.wait()
                DispatchQueue.global().async {
                    self.bankClerk.handleDeposit(for: currentCustomer.ticketNumber)
                    semaphore.signal()
                }
            default:
                return
            }
            
//            if currentCustomer.business == "대출" {
//                let loanQueue = DispatchQueue(label: "대출업무")
//                loanQueue.async {
//                    self.bankClerk.handleLoan(for: currentCustomer.ticketNumber)
//                }
//            } else if currentCustomer.business == "예금" {
//                semaphore.wait()
//                DispatchQueue.global().async {
//                    self.bankClerk.handleDeposit(for: currentCustomer.ticketNumber)
//                    semaphore.signal()
//                }
//            }
        }
    }
    
    func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
