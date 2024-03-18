//
//  ContentView.swift
//  iExpense
//
//  Created by Jastin on 26/2/24.
//

import SwiftUI

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
