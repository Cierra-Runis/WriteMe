//
//  Item.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import Foundation
import SwiftData

@Model
final class Project {
    @Attribute(.unique)
    var name: String
    var createAt: Date
    var editAt: Date

    init(
        name: String = "",
        createAt: Date = Date.now,
        editAt: Date = Date.now
    ) {
        self.name = name
        self.createAt = createAt
        self.editAt = editAt
    }
}
