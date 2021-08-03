//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var bank = Bank()

}

extension BankManager {
    func takeAnswer() -> String? {
        let question = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(question, terminator: "")
        let input = readLine()
        return input
    }
}
