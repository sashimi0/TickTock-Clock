//
//  ContentView.swift
//  TickTock Clock
//
//  Created by sasha on 7/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    @State private var textColor: Color = .primary
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ColorPicker("", selection: $textColor)
            .padding(.horizontal)
        
        VStack(spacing: 20) {
            Text("Current Time")
                .font(.title)
                .bold()
                .foregroundColor(textColor)
            
            Text(timeString(from: currentTime))
                .font(.system(size: 48, weight: .medium, design: .monospaced))
                .foregroundColor(textColor)
                .padding(.horizontal)
            
            Text(dateString(from: currentTime))
                .font(.title2)
                .foregroundColor(textColor)
                .padding(.horizontal)
        }
        .onReceive(timer) { input in
            self.currentTime = input
        }
        .padding()
    }
    
    func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
    
    func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
