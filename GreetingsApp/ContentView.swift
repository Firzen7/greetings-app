//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Ondrej on 21.12.2022.
//

import SwiftUI

// has to inherit from Identifiable so that we can use ForEach below
struct DataItemModel : Identifiable {
    var id = UUID()   // this is neccessary when extending type Identifiable
    let text: String
    let color: Color
}

struct ContentView: View {
   
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
                TextView(text: "M1", color: .red)
                TextView(text: "Test", color: .green)
                TextView(text: "Good!", color: .blue)
                
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
        ContentView()
    }
}

struct TextView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(20)
            .shadow(color: color.opacity(0.4), radius: 10, x: 10, y: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 2.8) {
            Text("Vítej!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Toto je pokus.")
                .font(.headline)
                .fontWeight(.thin)
        }.padding()
    }
}

struct MessagesView: View {
    // here are defined view models for TextViews to be rendered later
    let messages = [
        DataItemModel(text: "Ahoj", color: .purple),
        DataItemModel(text: "To jsem ja", color: .green),
        DataItemModel(text: "Ondra", color: .blue)
    ]
    
    // here I am adding views using cycle from list of view models
    var body: some View {
        ForEach(messages, content: { item in
            TextView(text: item.text, color: item.color)
        })
    }
}

struct BackgroundView: View {
    var body: some View {
        // without ignoreSafeArea this background wouldn't cover
        // top status bar and bottom system button area
        // Color.black.opacity(0.5).ignoresSafeArea()
        
        LinearGradient(colors: [.blue, .yellow, Color(red: 139/255, green: 80/255, blue: 240/255), .green],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .opacity(0.2)
        .ignoresSafeArea()
    }
}
