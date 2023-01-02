//
//  BackgroundView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

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

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
