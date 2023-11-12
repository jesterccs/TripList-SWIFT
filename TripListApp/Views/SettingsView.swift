//
//  SettingsView.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var fontSize: Double
    @State private var isEditing = false
    @State var pickerValue = 0
    @Binding var selectedColor: Color
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Font size (\(String(format: "%.2f", fontSize))px)")
                Slider(
                    value: $fontSize,
                    in: 14...30,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                
                HStack {
                    Text("Text Color ")
                    
                    Picker("", selection: $pickerValue, content: {
                        Text("Black").tag(0)
                        Text("Red").tag(1)
                        Text("Green").tag(2)
                        Text("Blue").tag(3)
                    })
                    .pickerStyle(.wheel)
                    .onChange(of: pickerValue, {
                        switch pickerValue {
                        case 0:
                            selectedColor = .black
                        case 1:
                            selectedColor = .red
                        case 2:
                            selectedColor = .green
                        case 3:
                            selectedColor = .blue
                        default:
                            selectedColor = .red
                        }
                    })
                        
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedColor)
                }
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(fontSize: .constant(14.0), selectedColor: .constant(.black))
}
