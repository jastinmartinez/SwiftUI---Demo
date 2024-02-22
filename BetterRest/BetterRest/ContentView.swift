//
//  ContentView.swift
//  BetterRest
//
//  Created by Jastin on 11/2/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount  = 8.0
    @State private var coffeeAmount = 1
    @State private var messageResultAlert = (title: "",message: "", isPresented: false)
    
    private static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                VStack(alignment: .leading,spacing: 0, content:  {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                    .labelsHidden()
                })
                
               
                VStack(alignment: .leading,spacing: 0, content:  {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                })
                
                VStack(alignment: .leading,spacing: 0, content:  {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(coffeeAmount..<21, id: \.self) { coffee in
                            Text(coffee, format: .number)
                        }
                    }
                })
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(messageResultAlert.title, isPresented: $messageResultAlert.isPresented) {
                Button("Ok") {}
            } message: {
                Text(messageResultAlert.message)
            }
        }
    }
    
    private func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
           
            let (hour, minute) = fromHourMinute()
            let sleepCalculatorInput = SleepCalculatorInput(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let prediction = try model.prediction(input: sleepCalculatorInput)
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            messageResultAlert = ("Your ideal bedtime is...", sleepTime.formatted(date: .omitted, time: .shortened), true)
            
        } catch {
            messageResultAlert = ("Error", "Sorry, there was a problem calculating your bedtime.", true)
        }
    }
    
    private func fromHourMinute() -> (Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        return (hour, minute)
    }
}

#Preview {
    ContentView()
}
