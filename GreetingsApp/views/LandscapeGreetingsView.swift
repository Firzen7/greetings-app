//
//  LandscapeGreetingsView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

struct LandscapeGreetingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            HStack {
                LandscapeTitleView()

                VStack(alignment: .trailing) {
                
                    
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
                }
                .padding()
            }
        }
    }
}

struct LandscapeGreetingsView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeGreetingsView()
    }
}
