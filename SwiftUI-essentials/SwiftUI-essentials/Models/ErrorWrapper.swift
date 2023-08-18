//
//  ErrorWrapper.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/18.
//

import Foundation


struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
