//
//  TitleView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

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

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
