//
//  TextView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

/// Coloured button view with rounded corners and shadow
struct TextView: View {
    let text: LocalizedStringKey
    
    // instead of just `let color`, this needs to be `@State var color`,
    // to allow changing color on tap
    @State var color: Color
    
    let onTapColors: [Color] = [
        .blue, .orange, .black, .green, .red, .purple, .yellow, .gray
    ]
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(20)
            .shadow(color: color.opacity(0.4), radius: 10, x: 10, y: 10)
            .onTapGesture {
                // here we will pick random colour and render it on tap
                let length = onTapColors.count
                let randomIndex = Int.random(in: 0..<length)
                color = onTapColors[randomIndex]
            }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        // here it is possible to define multiple previews.
        // these are not part of the actual app
        VStack {
            TextView(text: "Test", color: .purple)
            TextView(text: "Test2", color: .orange)
        }
    }
}
