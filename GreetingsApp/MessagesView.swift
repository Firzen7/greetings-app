//
//  MessagesView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

/// Renders dynamically defined colourful TextViews
struct MessagesView: View {
    // here are defined view models for TextViews to be rendered later
    let messages = [
        DataItemModel(text: LocalizedStringKey("Hi"), color: Color("purple")),
        DataItemModel(text: LocalizedStringKey("This is me"), color: Color("green")),
        DataItemModel(text: LocalizedStringKey("Andrew"), color: Color("blue"))
    ]
    
    // here I am adding views using cycle from list of view models
    var body: some View {
        ForEach(messages, content: { item in
            TextView(text: item.text, color: item.color)
        })
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
