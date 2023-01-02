//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Ondrej on 21.12.2022.
//

import SwiftUI

// Has to inherit from Identifiable so that we can use ForEach below
/// This is the data model of the coloured buttons.
/// It contains a text string and a colour.
/// Inherits from Identifiable
struct DataItemModel : Identifiable {
    var id = UUID()   // this is neccessary when extending type Identifiable
    let text: LocalizedStringKey
    let color: Color
}

/// Main view of this screen
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
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

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

/// This view represents title and subtitle.
/// Subtitle can be changed by tapping
/// Also contains colourful circle that rotates on tap
struct TitleView: View {
    @State var isRotated: Bool = false
    
//    let onTapTitles: [String] = [
//        "Vítej!",
//        "Greetings!",
//        "Wilkommen!"
//    ]
    
    @State var subtitleIndex: Int = 0
    
    // String had to be changed to LocalizedStringKey for localized messages
    let onTapSubTitles: [LocalizedStringKey] = [
        LocalizedStringKey("This is a test."),
        LocalizedStringKey("Really just a test."),
        LocalizedStringKey("You don't believe me?"),
        LocalizedStringKey("This is not a button.")
    ]
    
    var body: some View {
        HStack {
            VStack {
                Text(LocalizedStringKey("Greetings!"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(onTapSubTitles[subtitleIndex])
                    .font(.headline)
                    .fontWeight(.thin)
                    .onTapGesture {
                        subtitleIndex = Int.random(in: 0..<onTapSubTitles.count)
                    }
            }.padding()
            
            Spacer()

            Circle()
                .strokeBorder(AngularGradient(gradient: Gradient(
                    colors: [Color("blue"), Color("red"), Color("green"), Color("blue")]),
                    center: .center,
                    angle: .zero),
                              lineWidth: 15, antialiased: true)
                .rotationEffect(isRotated ? .zero : .degrees(90))
                .frame(maxWidth: 70, maxHeight: 70)
                .onTapGesture {
                    // I have no idea how this can work, but `withAnimation` is able to antomatically
                    // animate perhaps any changes in visual state of views!!!
                    withAnimation {
                        isRotated.toggle()
                    }
                }
        }
    }
}

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

// Three slashes (/) are documentation comments visible using Option (Alt) + click
/// Represents background with colour gradient
struct BackgroundView: View {
    var body: some View {
        // without ignoreSafeArea this background wouldn't cover
        // top status bar and bottom system button area
        //Color.white.ignoresSafeArea()
        
        LinearGradient(colors: [Color("orange"), Color("yellow"), Color("blue"), Color("green")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .opacity(0.5)
        .ignoresSafeArea()
    }
}
