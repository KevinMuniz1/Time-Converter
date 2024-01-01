//
//  ContentView.swift
//  Time Conversion
//
//  Created by Kevin Muniz on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var userInput: Int = 0
    @State var timeUnitInput = "Seconds"
    @State var timeUnitOutput = "Minutes"
    private var timeChoices = ["Seconds", "Minutes", "Hours", "Days" ]
    
    
    
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
                Section("Enter Conversion Input") {
                    TextField("Enter an amount", value: $userInput, format: .number)
                }
                Section("Time Conversion result") {
                    Text("Output")
                }
            }.navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
