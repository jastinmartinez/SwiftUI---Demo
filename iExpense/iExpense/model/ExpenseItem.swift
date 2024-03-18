//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jastin on 18/3/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id: UUID
    let name: String
    let type: String
    let value: Double
    
    init(name: String, type: String, value: Double) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.value = value
    }
}
