//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startBank() {
    print("1. 은행 개점 \n2. 종료")
    guard let userInput = readLine() else { return print("nil값입니다. 숫자를 입력해주세요")}
    let userInputNumber = Int(userInput)
    if userInputNumber == 1 {
        print("입력 : 1")
       
    } else if userInputNumber == 2 {
        print("입력 : 2")
        return
    } else {
        print("메뉴 숫자 1과 2중에 입력해주세요")
      startBank()
    }
    //    var bank = Bank(numberOfBanker: <#Int#>, totalNumberOfClinet: <#Int#>)
}


