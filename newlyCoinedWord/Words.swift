//
//  Words.swift
//  newlyCoinedWord
//
//  Created by 김정윤 on 5/20/24.
//

import Foundation

struct Word {
    let word: String
    let desc: String
}

extension Word {
    static let examples = [
        Word(word: "중꺽마", desc: "중요한 것은 꺾이지 않는 마음!🔥"),
        Word(word: "디토합니다", desc: "'나도 그래요', '동감입니다' 라는 의미"),
        Word(word: "가나디", desc: "강아지를 귀여운 방식으로 표현"),
        Word(word: "캘박", desc: "캘린더에 박제"),
        Word(word: "최최차차", desc: "최애는 최애고 차은우는 차은우"),
        Word(word: "당모치", desc: "당연히 모든 치킨은 옳다"),
        Word(word: "스불재", desc: "스스로 불러온 재앙 ")
    ]
}
