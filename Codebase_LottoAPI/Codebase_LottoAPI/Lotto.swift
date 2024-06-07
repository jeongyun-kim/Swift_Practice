//
//  Lotto.swift
//  Codebase_LottoAPI
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit

struct Lotto: Decodable {
    let drwNoDate: String
    let firstWinamnt: Int
    let firstPrzwnerCo: Int
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    var desc: String {
        return "1등 당첨금 \(firstWinamnt.formatted())원 (당첨 복권수 \(firstPrzwnerCo)개)"
    }
}
