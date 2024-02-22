//
//  ContentView.swift
//  BetterRest
//
//  Created by Jastin on 11/2/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date.now
    @State private var sleepAmount  = 8.0
    @State private var coffeeAmount = 1
    @State private var messageResultAlert = (title: "",message: "", isPresented: false)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time",
                           selection: $wakeUp,
                           displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount.formatted()) cups(s)", value: $coffeeAmount, in: 1...20)
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
