//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct BankClerk {
}

extension BankClerk {
    func work(for customer: Int?) {
        guard let customerNumber = customer else {
            return
        }
        print("\(customerNumber)번 고객 업무시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customerNumber)번 고객 업무완료")
        
    }
    
    func work2(for customer: Customer, group: DispatchGroup, runLoanQueue: DispatchQueue, runSaveQueue: DispatchQueue) {
        let queueNumber = customer.tiketNumber
        let task = customer.business
        switch task {
        case "loan":
            workLoan(queueNumber, group, runLoanQueue)
        case "save":
            workSave(queueNumber, group, runSaveQueue)
        default:
            fatalError()
        }
    }
    
    func workLoan(_ customerTicketNum: Int, _ loanGroup: DispatchGroup, _ runQueue: DispatchQueue) {
        loanGroup.enter()
        runQueue.async(group: loanGroup) {
            work(for: customerTicketNum)
            print("workLoan완료")
            loanGroup.leave()
        }
    }
    
    func workSave(_ customerTicketNum: Int, _ loanGroup: DispatchGroup, _ runQueue: DispatchQueue) {
        let semaphore = DispatchSemaphore(value: 2)
        loanGroup.enter()
        semaphore.wait()
        runQueue.async(group: loanGroup) {
            work(for: customerTicketNum)
            semaphore.signal()
            print("workSave완료")
            loanGroup.leave()
        }
    }
    
}
