//
//  ContentView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            GiphyView(giphyViewModel: GiphyViewModel(GiphyService(), UrlSessionService()))
                
                .navigationBarTitle("Gift Of Gifs")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            print("Trending")
                        }) {
                            Text("Trending")
                                .font(Fonts.buttonFont)
                                .foregroundColor(Color.body)
                        },
                    trailing:Button(action: {
                        print("Show CV view")
                    }) {
                        Text("CV")
                            .font(Fonts.buttonFont)
                            .foregroundColor(Color.body)
                    }
                        
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
