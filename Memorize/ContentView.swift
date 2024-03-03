//
//  ContentView.swift
//  Memorize
//
//  Created by Tristan Davis on 2024-02-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
        }
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth: 2.0)
                Text("🐼")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth: 2.0).fill(.gray)
            }
        }
        .padding()
    }
}









#Preview {
    ContentView()
}
