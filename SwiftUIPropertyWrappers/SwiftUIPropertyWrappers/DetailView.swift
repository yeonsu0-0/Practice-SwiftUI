//
//  DetailView.swift
//  SwiftUIPropertyWrappers
//
//  Created by yeonsu on 2023/08/03.
//

import SwiftUI

struct DetailView: View {
    @Binding var showDetailView: Bool
    @Binding var changeTextColorToRed: Bool
    
    var body: some View {
        VStack {
            Button {
                showDetailView.toggle()
            } label: {
                Text("Dismiss")
        }
            Button {
                changeTextColorToRed.toggle()
            } label: {
                Text("텍스트 강조하기")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showDetailView: .constant(false), changeTextColorToRed: .constant(false))
    }
}
