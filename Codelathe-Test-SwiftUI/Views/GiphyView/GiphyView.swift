//
//  GiphyView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct GiphyView: View {
    
    @ObservedObject var giphyViewModel: GiphyViewModel
    
    var body: some View {
        
        List(giphyViewModel.gifs, id: \.gifUrl) { gif in
            GiphyRowView(giphyRowViewModel: GiphyRowViewModel(
                            gif: gif,
                            UrlSessionService()))
        }
        
    }
}

struct GiphyView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyView(giphyViewModel: GiphyViewModel(GiphyService()))
    }
}
