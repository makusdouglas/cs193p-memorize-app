//
//  ContentView.swift
//  Memorize
//
//  Created by Markus Douglas on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(text: "💀", isFaceUp: true)
            CardView(text: "🍎")
            CardView(text: "⚽️")
            CardView(text: "👻")
        }
        .padding()
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    var text: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text(text)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
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
