//
//  MainView.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
//

import SwiftUI

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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
