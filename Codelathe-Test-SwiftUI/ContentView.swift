//
//  ContentView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GiphyView(giphyViewModel: GiphyViewModel(GiphyService()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
