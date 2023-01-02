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
    
    // these are state variables which are bound to individual views below
    @State var subtitleIndex: Int = 0
    @State var isRotated: Bool = false
    
    var body: some View {
        HStack {
            // to bind state variable to a view with binding,
            // we need to use $variable syntax
            // this way we will be able to control state of child views from this
            // parent view
            TitleAndSubView(subtitleIndex: $subtitleIndex)
            
            Spacer()

            RotateCircleView(isRotated: $isRotated)
        }
    }
}

struct LandscapeTitleView: View {
    
    // these are state variables which are bound to individual views below
    @State var subtitleIndex: Int = 0
    @State var isRotated: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            // to bind state variable to a view with binding,
            // we need to use $variable syntax
            // this way we will be able to control state of child views from this
            // parent view
            TitleAndSubView(subtitleIndex: $subtitleIndex)
            RotateCircleView(isRotated: $isRotated)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
//        TitleView()
        LandscapeTitleView()
    }
}

struct TitleAndSubView: View {
    // String had to be changed to LocalizedStringKey for localized messages
    let onTapSubTitles: [LocalizedStringKey] = [
        LocalizedStringKey("This is a test."),
        LocalizedStringKey("Really just a test."),
        LocalizedStringKey("You don't believe me?"),
        LocalizedStringKey("This is not a button.")
    ]
    
    // Binding variables don't have initial value - they are initialized by parent view
    @Binding var subtitleIndex: Int
    
    var body: some View {
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
    }
}

struct RotateCircleView: View {
    @Binding var isRotated: Bool
    
    var body: some View {
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
