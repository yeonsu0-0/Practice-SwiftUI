//
//  Theme.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//


// Color Theme
// SwiftUI에서는 색상을 뷰 계층 구조에 직접 추가할 수 있는 뷰 인스턴스로 취급

import SwiftUI

// 모든 열거형 케이스에 쉽게 접근 -> CaseIterable 프로토콜 채택
// theme name을 고유 id로 사용 -> Identifiable 프로토콜 채택

enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
