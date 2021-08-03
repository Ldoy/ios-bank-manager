//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum MenuSelectionError: Error, LocalizedError {
    case wrongInput
    case emptyInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다."
        case .emptyInput:
            return "입력값이 없습니다."
        }
    }
}

// readline, print해주는 애
struct BankManager {
    enum BankOpenMenu {
        static let open = 1
        static let exit = 2
    }
    
    let bank = Bank()
    
    func start() {
        printMenu()
        do {
            try decideBankOpen()
        } catch {
            print("잘못된 입력입니다.")
            printMenu()
        }
    }
    
    func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func decideBankOpen() throws {
        guard let readLine = readLine(), let menuSelection = Int(readLine) else {
            return
        }
        
        //        if menuSelection == bankOpenMenu.open {
        //            bank.open()
        //            bank.close()
        //        } else if menuSelection == bankOpenMenu.exit {
        //            return
        //        }
        // 에러처리?
        // switch문이 낫나?
        
        switch menuSelection {
        case BankOpenMenu.open:
            bank.open()
            bank.close()
        case BankOpenMenu.exit:
            return
        default:
            MenuSelectionError.wrongInput
        }
    }
}
