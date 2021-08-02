//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// readline, print해주는 애
struct BankManager {
    enum bankOpenMenu {
        static let open = 1
        static let exit = 2
    }
    
    let bank = Bank()
    
    func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func decideBankOpen() {
        guard let readLine = readLine(), let menuSelection = Int(readLine) else {
            return
        }
    
        if menuSelection == 1 {
            bank.open()
            bank.close()
        } else if menuSelection == 2 {
            return
        }
    }
}

struct Bank {
    let banker = Banker()
    let customer = Customer()
    let customerQueue = Queue<Int>()
    
    func open() {
        customer.goToBank(of: customerQueue)
        // open 메소드 안에 들어가야하는가? 콘솔앱에서 실행해야하는가?
        banker.handleTask(of: customerQueue, customer.customerNumber)
    }
    
    func calculateTaskTime() -> Double {
        let start = CFAbsoluteTimeGetCurrent()
        banker.handleTask(of: customerQueue, customer.customerNumber)
        let diff = CFAbsoluteTimeGetCurrent() - start
        
        return diff
    }
    
    // 업무 처리 고객과 업무시간을 매개변수로 받아 console에서 결정할 것이냐, Bank가 알고있도록 Bank의 프로퍼티로 만들 것이냐
    func close() {
        if customerQueue.isEmpty() {
            let taskTime = calculateTaskTime()
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.customerNumber)명이며, 총 업무시간은 \(taskTime)초입니다.")
        }
    }
}

struct Banker {
    // 에러해결을 위해 1.Queue를 클래스로 만든다(customer에서도 써야하니까) 2.Bank인스턴스를만든다 3. customerQueue를 Banker에 만든다.
    // 0.7초의 딜레이를 주기 위해서 어떤 방식을 채택할 것인가? DispatchQueue에 deadline을 주는 방식은 업무처리 자체에 준게 아닌 것인가?
    func handleTask(of customer: Queue<Int>, _ customerNumber: Int) {
        for i in 1...customerNumber {
            print("\(i)번 고객 업무 시작")
            customer.dequeue()
            Thread.sleep(forTimeInterval: 0.7)
            print("\(i)번 고객 업무 완료")
        }
    }
}

struct Customer {
    let customerNumber = Int.random(in: 10...30)
    
    func goToBank(of customer: Queue<Int>) {
        for i in 1...customerNumber {
            customer.enqueue(i)
        }
    }
}
