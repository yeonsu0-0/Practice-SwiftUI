//
//  SwiftUI_essentialsApp.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//

import SwiftUI

@main
struct SwiftUI_essentialsApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
