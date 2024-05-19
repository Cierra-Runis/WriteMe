//
//  Item.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
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
