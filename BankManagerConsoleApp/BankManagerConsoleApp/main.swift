//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Bank {
    var totalBanker: Int = 1
    let totalCustomerNumber: Int
    
    init() {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        self.totalCustomerNumber = totalNumber
    }
    
}

extension Bank {
    mutating func makingWaitingLine(from totalCustomerNumber: Int) -> Queue<Int> {
        var waitingLine = Queue<Int>()
        
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(i)
        }
        
        return waitingLine
    }
    
    mutating func notifyClosing(totalCustomer: Int, 대출: Int, 예금: Int) {
        let needTimeFor대출 = 0.7
        let needTimeFor예금 = 1.1
        let totalTime = Double(대출) * needTimeFor대출 +  Double(예금) * needTimeFor예금
        print("총 \(totalCustomer)입니다. 걸린 시간은 \(totalTime)")
    }
}

enum Task: String, CaseIterable {
    case 대출1, 대출2, 예금
}

struct Customer {
    let task: String
    let tagNumber: Int
    
    init(tagNumber: Int) {
        let randomTask = Task.allCases.randomElement()?.rawValue
        self.task = randomTask ?? " "
        self.tagNumber = tagNumber
    }
}


struct Banker {
    var capacityCustomerNumber: Int = 1
}

extension Banker {
    func 업무(_ customer: Customer, _ waitingLine: inout Queue<Int>) {
        print("\(customer.tagNumber)번 \(customer.task)업무 시작")
        waitingLine.dequeue()
        DispatchQueue.global().async {
            print("\(customer.tagNumber)번 \(customer.task)업무 끝남")
        }
    }
    
    func work(_ total: Int, _ banker: inout Banker, _ waitingLine: inout Queue<Int>, _ 대출: inout Int, _ 예금: inout Int) {
        for i in 1...total {
            let customer = Customer(tagNumber: i)
            switch customer.task {
            case "대출1":
                업무(customer, &waitingLine)
                대출 += 1
            case "대출2":
                업무(customer, &waitingLine)
                대출 += 1
            default:
                업무(customer, &waitingLine)
                예금 += 1
            }
        }
    }
    
}





func main3() {
    var bank = Bank()
    let total = bank.totalCustomerNumber
    var banker = Banker()
    var waitingLine = bank.makingWaitingLine(from: total)
    var 대출 = 0
    var 예금 = 1
    banker.work(total, &banker, &waitingLine, &대출, &예금)
    sleep(2)
    bank.notifyClosing(totalCustomer: total, 대출: 대출, 예금: 예금)
}



main3()
//func start() {
//    var bank = Bank()
//    var banker1 = Banker()
//    var banker2 = Banker()
////    var banker3 = Banker()
//    let totalCustomer = bank.totalCustomerNumber
//    //    let customerTask = customer.task
//    var waitingLine = bank.makingWaitingLine(from: totalCustomer)
//
//
//}

//func end() {
//    return
//}
//
//func main() {
//    let input = readLine()
//
//    if input == "1" {
//        start()
//
//    }
//    end()
//}
//
//main()
//



//func start() {
//    var bank = Bank()
//    var banker = Banker()
//    let totalCustomer = bank.totalCustomerNumber
////    let customerTask = customer.task
//
//    var waitingLine = bank.makingWaitingLine(from: totalCustomer)
//
//    for _ in 1...totalCustomer {
//    banker.takeTask(watingLine: &waitingLine)
//    }
//
//    bank.notifyClosing(totalCustomer: totalCustomer)
//}
//
//func end() {
//    return
//}
//
//func main() {
//    let input = readLine()
//
//    if input == "1" {
//        start()
//
//    }
//    end()
//}
//
//main()
