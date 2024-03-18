//
//  ContentView.swift
//  iExpense
//
//  Created by Jastin on 26/2/24.
//

import SwiftUI

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

struct ExpenseItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var type = ""
    @State private var value = 0.0
    private let types = ["Personal", "Business"]
    let expense: Expense
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                Picker("type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add")
            .toolbar {
                Button("save") {
                    expense.add(ExpenseItem(name: name, type: type, value: value))
                    dismiss()
                }
            }
        }
    }
}


struct ExpenseListView: View {
    
    @State private var expense = Expense()
    @State private var isExpenseItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expense.expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(item.type)
                                .font(.subheadline)
                        }
                        Spacer()
                        Text(item.value, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: expense.remove(_:))
            }
            .navigationTitle("Expense Tracker")
            .sheet(isPresented: $isExpenseItemView, content: {
                ExpenseItemView(expense: expense)
            })
            .toolbar {
                Button("Add", systemImage: "plus") {
                    isExpenseItemView = true
                }
            }
        }
    }
}

#Preview {
    ExpenseListView()
}

#Preview {
    ExpenseItemView(expense: Expense())
}
