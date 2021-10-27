//
//  ContentView.swift
//  CheckSplitting
//
//  Created by Jastin on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount:Double = 0.0
    @State private var amountOfPerson:Int = 2
    @State private var percenteOfTip:Int = 0
    @FocusState private var isCheckAmountFocus:Bool
    
    private var totalPerPerson:Double {
        
        return  ( checkAmount + ( ( checkAmount / 100 ) * Double(percenteOfTip) ) ) / Double(amountOfPerson)
        
    }
    
    private let tips = (0...5).map({$0 * 5})
    private let defaultCurrencyCode = Locale.current.currencyCode ?? "USD"
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Chek Amount", value: $checkAmount, format: .currency(code: defaultCurrencyCode))
                        .keyboardType(.decimalPad)
                        .focused($isCheckAmountFocus)
                }header: {
                    Text("Check Amount")
                }
                
                Section {
                    Picker("Persons", selection: $amountOfPerson) {
                        ForEach(2..<100,id: \.self) {
                            Text("\($0)")
                        }
                    }
                }header: {
                    Text("Number Of Person")
                }
                
                Section {
                    Picker("", selection: $percenteOfTip) {
                        ForEach(tips,id: \.self) {
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Tips")
                }
                
                Section {
                    HStack()
                    {
                        Spacer()
                        Text(totalPerPerson,format: .currency(code: defaultCurrencyCode))
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    }
                    
                }header: {
                    Text("Result")
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isCheckAmountFocus = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
