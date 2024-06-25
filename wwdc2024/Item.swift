//
//  Item.swift
//  wwdc2024
//
//  Created by MMMBP on 6/25/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
