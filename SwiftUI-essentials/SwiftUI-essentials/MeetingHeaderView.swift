//
//  MeetingHeaderView.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/05.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaing: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaing
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(secondsRemaing)
    }
    
    private var minutesRemainging: Int {
        secondsRemaing / 60
    }
    
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("\(secondsRemaing)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaing")
        .accessibilityValue("\(minutesRemainging) minutes")
        .padding([.top, .horizontal])
            
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaing: 180, theme: .bubblegum).previewLayout(.sizeThatFits)
    }
}
