//
//  GiphyView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct GiphyView: View {
    
    @ObservedObject var giphyViewModel: GiphyViewModel
    
    @State var searchTerm: String = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            List(0 ..< giphyViewModel.gifs.count, id: \.self) { index in
                
                GiphyRowView(
                    giphyRowViewModel: GiphyRowViewModel(
                        gif: self.giphyViewModel.gifs[index],
                        self.giphyViewModel.urlSessionService)
                )
                .animation(.default)
                .onAppear() {
                    
                    // Preload instead of doing it on the last cell
                    if(index == giphyViewModel.gifs.count - 2) {
                        self.giphyViewModel.loadNextGifSet()
                    }
                }
                
            }
            
            // Handle opening of the keyboard
            Divider()
            HStack(spacing: 16) {
                TextField("Search gifs by search term", text: $searchTerm)
                    .font(Fonts.bodyFont)
                    .padding(8)
                    .cornerRadius(5)
                    .background(Color.background)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.borders, lineWidth: 1)
                    )
                
                Button(action: {
                    self.giphyViewModel.getGifs(by: .bySearchTerm, searchTerm: self.searchTerm)
                }, label: {
                    Text("Search")
                        .font(Fonts.buttonFont)
                        .foregroundColor(Color.body)
                })
            }
            .padding(.top, 15)
            .padding(.leading, 25)
            .padding(.trailing, 25)
            
        }
        
        .navigationBarTitle("Gift Of Gifs")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading:
                Button(action: {
                    self.giphyViewModel.getGifs(by: .trending)
                    self.searchTerm = ""
                }) {
                    Text("Trending")
                        .font(Fonts.buttonFont)
                        .foregroundColor(Color.body)
                },
            trailing: NavigationLink(
                destination: VirtualCVView(virtualCVViewModel: VirtualCVViewModel(candidate: candidate))) {
                Text("CV")
                    .font(Fonts.buttonFont)
                    .foregroundColor(Color.body)
            }
            
            
        )
        
    }
}

struct GiphyView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyView(giphyViewModel: GiphyViewModel(GiphyService(), UrlSessionService()))
    }
}
