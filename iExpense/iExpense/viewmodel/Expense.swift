//
//  Expense.swift
//  iExpense
//
//  Created by Jastin on 18/3/24.
//

import Foundation

@Observable
final class Expense {
    private(set) var expenses = [ExpenseItem]() {
        didSet {
            store()
        }
    }
    private let key = "key"
    private let storer = UserDefaults.standard
    
    func add(_ item: ExpenseItem) {
        expenses.append(item)
    }
    
    func remove(_ item: IndexSet) {
        expenses.remove(atOffsets: item)
    }
    
    init() {
        onInit()
    }
    
    private func onInit() {
        if let data = storer.data(forKey: key),
           let expenses = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
            self.expenses = expenses
        } else {
            expenses = []
        }
    }
    
    private func store() {
        if let data = try? JSONEncoder().encode(expenses) {
            storer.setValue(data, forKey: key)
        }
    }
}
