//
//  Tag.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/20/24.
//

import Foundation

struct Tag {
    let title: String
    let imageName: String
    let alert: String?
    let desc: String?
}

extension Tag {
    static let tagDatas: [Tag] = [
        Tag(title: "공개 예정", imageName: "blue", alert: "이런! 찾으시는 작품이 없습니다.", desc: "다른 영화, 시리즈, 배우, 감독 또는 시리즈를 검색해보세요"),
        Tag(title: "모두의 인기 콘텐츠", imageName: "turquoise", alert: nil, desc: nil),
        Tag(title: "TOP 10 시리즈", imageName: "pink", alert: "여기는 탑텐시리즈가 나올거에요~!~", desc: " :)")
    ]
}
