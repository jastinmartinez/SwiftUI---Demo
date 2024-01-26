//
//  ContentView.swift
//  WeSplit
//
//  Created by Jastin on 22/1/24.
//

import SwiftUI

struct WeSplitView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isAmountFocused: Bool

    private let tipPercentages = (0...25).filter({ $0 % 5 == 0 })
    private let currencyIdentifier = Locale.current.currency?.identifier ?? "USD"
    
    private var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal / people
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: currencyIdentifier))
                    .keyboardType(.decimalPad)
                    .focused($isAmountFocused)
    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)

                }
                
                Section("Tip") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total") {
                    Text(totalPerPerson,
                         format: .currency(code: currencyIdentifier))
                }
    
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isAmountFocused {
                    Button("Done") {
                        isAmountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    WeSplitView()
}
