//
//  SwiftUI_essentialsApp.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//

import SwiftUI

@main
struct SwiftUI_essentialsApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
