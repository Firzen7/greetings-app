//
//  MainView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

// MARK: this is a bookmark visible in Xcode navigation
struct MainView: View {
    // environment variables access syntax
    // in var we can name the variable as we wish
    @Environment(\.horizontalSizeClass)
        var horizontalSizeClass
    
    @Environment(\.verticalSizeClass)
        var verticalSizeClass
    
    var body: some View {
        // here we detect landscape mode
        
        if(horizontalSizeClass == .compact && verticalSizeClass == .regular) {
            // This is portrait mode
            GreetingsView()
        }
        else {
            // This is landscape mode
            LandscapeGreetingsView()
        }
    }
}

// TODO: todos with doubledot will be visible in Xcode navigation
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
