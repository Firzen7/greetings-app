//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Ondrej on 21.12.2022.
//

import SwiftUI

/// Main view of this screen
struct GreetingsView: View {
   
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .trailing) {
                
                TitleView()
                
                Spacer()
                
                // When there are just built-in views (like Text), it is possible to press
                // Command and click on them. Dropdown will appear from which I will
                // select "Extract Subview".
                // That will automatically create custom view in separate struct
                // containing selected view, which I can then alter as I need
                
                // ^^ This is how I created these TextViews:
                TextView(text: LocalizedStringKey("M1"), color: Color("red"))
                TextView(text: LocalizedStringKey("Test"), color: Color("green"))
                TextView(text: LocalizedStringKey("Good!"), color: Color("blue"))
                
                MessagesView()
                
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // here we can define previews
        // is is possible to add multiple previews
        // they are ignored in actual compiled app
        GreetingsView()
        GreetingsView()
            .preferredColorScheme(.dark)
    }
}
