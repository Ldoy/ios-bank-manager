//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation


struct BankClerk {
    // 에러해결을 위해 1.Queue를 클래스로 만든다(customer에서도 써야하니까) 2.Bank인스턴스를만든다 3. customerQueue를 Banker에 만든다.
    // 0.7초의 딜레이를 주기 위해서 어떤 방식을 채택할 것인가? DispatchQueue에 deadline을 주는 방식은 업무처리 자체에 준게 아닌 것인가?
    func handleTask(of customer: Queue<Int>, _ customerNumber: Int) {
        for i in 1...customerNumber {
            print("\(i)번 고객 업무 시작")
            customer.dequeue()
//            Thread.sleep(forTimeInterval: 0.7)
            print("\(i)번 고객 업무 완료")
        }
    }
    
    // 은행원이 3명이 되면 이니셜라이저에서 넘버를 정해주고 DispatchQueue를 반복문으로 은행원 수만큼 보내주는 로직?
}
