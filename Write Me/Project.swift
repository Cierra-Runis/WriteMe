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
    var name: String

    init(name: String) {
        self.name = name
    }
}
