//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Mahmoud Fouad on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var amount  = ""
    
    private let units = ["meters", "kilometers", "feet", "yards"]
    private let measurements = [UnitLength.meters,
                                UnitLength.kilometers,
                                UnitLength.feet,
                                UnitLength.yards]
    
    private var result: Double {
        let selectedInputUnit = Measurement(
            value: Double(amount) ?? 0,
            unit: measurements[self.inputUnit]
        )
        return selectedInputUnit.converted(to: measurements[self.outputUnit]).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Units Section")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<self.units.count, id: \.self) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Output Units Section")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0..<self.units.count, id: \.self) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(self.result, specifier: "%.2f") ")

                }
            }
            .navigationBarTitle(Text("Unit Conversion"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
