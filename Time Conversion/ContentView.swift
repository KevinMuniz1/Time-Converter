//
//  ContentView.swift
//  Time Conversion
//
//  Created by Kevin Muniz on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var userInput: Double = 0
    @State var timeUnitInput = "Seconds"
    @State var timeUnitOutput = "Minutes"
    private var timeChoices = ["Seconds", "Minutes", "Hours", "Days" ]
    var result: String {
        let inputMultiplier: Double
        let outputMultiplier: Double
        switch timeUnitInput {
        case "Minutes":
            inputMultiplier = 60
        case "Hours":
            inputMultiplier = 3600
        case "Days":
            inputMultiplier = 86400
        default:
            inputMultiplier = 1
        }
        switch timeUnitOutput {
        case "Minutes":
            outputMultiplier = 1/60
        case "Hours":
            outputMultiplier = 1/3600
        case "Days":
            outputMultiplier = 1/86400
        default:
            outputMultiplier = 1
        }
        let input = userInput * inputMultiplier
        let output = input * outputMultiplier
        return "\(output) \(timeUnitOutput.lowercased())"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from:") {
                    Picker("Convert from:", selection: $timeUnitInput) {
                        ForEach(timeChoices, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("To: ") {
                    Picker("To:", selection: $timeUnitOutput){
                        ForEach(timeChoices, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Amount to convert") {
                    TextField("Enter an amount", value: $userInput, format: .number)
                }
                Section("Result") {
                    Text(result)
                }
            }.navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
