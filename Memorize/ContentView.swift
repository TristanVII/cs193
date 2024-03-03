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
            CardView()
        }.foregroundColor(.black)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.fill(.white)
                    .strokeBorder(lineWidth: 2.0)
                Text("🐼")
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .padding()
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
