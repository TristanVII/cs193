//
//  ContentView.swift
//  Memorize
//
//  Created by Tristan Davis on 2024-02-29.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐼", "🦄", "🐲", "💩", "👩🏻‍🎤", "🧛🏻‍♂️"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cardsView
            }
            Spacer()
            buttonsView
        }
        .padding()
        
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        return Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol).imageScale(.large).font(.title2)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardsView: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120.0))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.black)
    }
    
    var buttonsView: some View {
        HStack {
            Spacer()
            cardRemove
            Spacer()
            cardAdder
            Spacer()
        }
    }
    
    var cardRemove: some View {
            cardCountAdjuster(by: -1, symbol: "minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                    .strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            }
            base.fill(.black).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
