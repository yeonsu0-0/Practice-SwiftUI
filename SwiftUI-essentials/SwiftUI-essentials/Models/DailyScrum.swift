//
//  DailyScrum.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//

import Foundation

/*
 
 List는 각 요소마다 고유의 값을 할당해줘야 한다.
 스크럼 각각 고유의 값을 갖게 하려면 Identifiable 프로토콜을 채택하고, id 속성을 추가해주면 된다.
 
 */

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}


extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                           attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                           lengthInMinutes: 10,
                           theme: .yellow),
                DailyScrum(title: "App Dev",
                           attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                           lengthInMinutes: 5,
                           theme: .orange),
                DailyScrum(title: "Web Dev",
                           attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                           lengthInMinutes: 5,
                           theme: .poppy)
    ]
}
