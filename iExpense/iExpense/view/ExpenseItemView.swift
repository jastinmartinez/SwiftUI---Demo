//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Jastin on 18/3/24.
//

import Foundation
import SwiftUI

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

#Preview {
    ExpenseItemView(expense: Expense())
}

