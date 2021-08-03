//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum MenuSelectionError: Error, LocalizedError {
    case wrongInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다."
        }
    }
}

struct BankManager {
    enum BankOpenMenu {
        static let open = 1
        static let exit = 2
    }
    
    let bank = Bank()
}

extension BankManager {
    func start() {
        printMenu()
        do {
            try decideBankOpen()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func decideBankOpen() throws {
        guard let input = readLine(), let menuSelection = Int(input) else {
            return
        }
        
        switch menuSelection {
        case BankOpenMenu.open:
            bank.open()
            bank.close()
        case BankOpenMenu.exit:
            return
        default:
            throw MenuSelectionError.wrongInput
        }
    }
}
