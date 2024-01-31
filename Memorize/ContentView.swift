//
//  ContentView.swift
//  Memorize
//
//  Created by Markus Douglas on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount: Int = 8
    var emojis: Array<String> = ["💀", "⚽️", "🍎", "👻", "🎹", "🚓", "🎲", "❤️", "😈", "🐶", "🐸", "🔥"]
    
    var body: some View {
        VStack{
            ScrollView {
                Cards
            }
            Spacer(minLength: 24)
            CardCountAdjusters
            
        }
        .padding()
    }
    
    var Cards: some View {
        LazyVGrid (columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) {index in
                if emojis.indices.contains(index) {
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: ContentMode.fit)
                }
            }
        }
        .foregroundColor(.teal)
    }
    
    var CardCountAdjusters: some View {
        HStack {
            CardRemover
            Spacer()
            Text("000 points").foregroundColor(.pink)
            Spacer()
            CardAdder
        }
    }
    
    func makeCardCountAdjuster(
        by offset: Int,
        symbol: String,
        label: String,
        alignment: HorizontalAlignment = HorizontalAlignment.leading
    ) -> some View {
        Button(
            action: {
                cardCount += offset
            },
            label: {
                VStack (alignment: alignment) {
                    Image(systemName: symbol)
                    Text(label)
                }
            }
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var CardRemover: some View {
        makeCardCountAdjuster(
            by: -1,
            symbol: "minus.square",
            label: "remove card"
        )
    }
    
    var CardAdder: some View {
        makeCardCountAdjuster(
            by: +1,
            symbol: "plus.square",
            label: "add card",
            alignment: HorizontalAlignment.trailing
        )
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base .opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
