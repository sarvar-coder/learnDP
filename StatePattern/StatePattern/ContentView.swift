//
//  ContentView.swift
//  StatePattern
//
//  Created by Sarvar Boltaboyev on 22/06/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.yellow.gradient)
                .frame(width: 200, height: 400)
                .overlay(alignment: .center) {
                    TrafficLight()
                }
        }
    }
    
    func TrafficLight() -> some View {
        VStack(spacing: 25) {
            Circle()
                .fill(.gray)
                .frame(width: 96, height: 96)
            Circle()
                .fill(.gray)
                .frame(width: 96, height: 96)
            Circle()
                .fill(.gray)
                .frame(width: 96, height: 96)
        }
    }
}

#Preview {
    ContentView()
}
