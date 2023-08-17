//
//  ScrumsView.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/02.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    // 값을 관찰하다가 비활성 상태가 되면 사용자 데이터 저장
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {saveAction()}
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
