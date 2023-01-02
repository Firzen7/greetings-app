//
//  DataItemModel.swift
//  GreetingsApp
//
//  Created by Ondrej on 02.01.2023.
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
