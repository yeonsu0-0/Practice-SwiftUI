//
//  TrailingIconLabelStyle.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//

import SwiftUI

/*
 
 Label icon 기본 생성 방식
 Label("\(scrum.lengthInMinutes)", systemImage: /*@START_MENU_TOKEN@*/"clock"/*@END_MENU_TOKEN@*/)
     .padding(.trailing, 20)
 
 위와 같이 생성하면 [아이콘 - label] 순으로 나타남
 [label - 아이콘] 순으로 바꾸기 위한 LabelStyle 프로토콜 생성
 
 */


struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    // label style을 속성 프로퍼티로 정의하여 .dot으로 접근 가능
    static var trailingIcon: Self { Self() }
}
