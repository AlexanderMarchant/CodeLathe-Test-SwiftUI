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
        
        List(0 ..< giphyViewModel.gifs.count, id: \.self) { index in
            GiphyRowView(
                giphyRowViewModel: GiphyRowViewModel(
                    gif: self.giphyViewModel.gifs[index],
                    self.giphyViewModel.urlSessionService)
            )
            .onAppear() {
                
                // Preload instead of doing it on the last cell
                if(index == giphyViewModel.gifs.count - 2) {
                    self.giphyViewModel.loadNextGifSet()
                }
            }
        }
        
    }
}

struct GiphyView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyView(giphyViewModel: GiphyViewModel(GiphyService(), UrlSessionService()))
    }
}
