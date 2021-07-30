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
    
    mutating func notifyClosing(totalCustomer: Int) {
        let needTimeForTask = 0.7
        let totalTime = Double(totalCustomer) * needTimeForTask
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
    mutating func startTask(watingLine: inout Queue<Int>) {
        let customer = watingLine.peek()
        print("\(String(describing: customer))번 고객 업무가 시작되었습니다.")
        
    }
    
    mutating func endTask(watingLine: inout Queue<Int>) {
        let work = watingLine.dequeue()
        print("\(String(describing: work))번 고객 업무가 끝났습니다.)")
    }
}


func main3() {
    // 고객의 태그와 헤드의 넘버가 값으면 고객의 테스크를 출려
    // 고객의 테스크가 대출이면 특정 쓰레드?
 
    // 시작은 메인큐에서, 끝내는 건 async
    var bank = Bank()
    var total = bank.totalCustomerNumber
    var a = bank.makingWaitingLine(from: total)

    for i in 1...total {
        let customer = Customer(tagNumber: i)
        switch customer.task {
        case "대출1":
            print("\(customer.tagNumber) 대출업무 시작")
            a.dequeue()
            DispatchQueue.global().async {
                print("\(customer.tagNumber)대출 업무끝남")
            }
        case "대출2":
            print("\(customer.tagNumber)번 대출업무 시작")
            a.dequeue()
            DispatchQueue.global().async {
                print("\(customer.tagNumber)대출 업무끝남")
            }
        default:
            a.dequeue()
            print("\(customer.tagNumber) 예금업무 시작")
            DispatchQueue.global().async {
                print("\(customer.tagNumber)예금 업무끝남")
            }
        }
    }
    
    bank.notifyClosing(totalCustomer: total)
    
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
