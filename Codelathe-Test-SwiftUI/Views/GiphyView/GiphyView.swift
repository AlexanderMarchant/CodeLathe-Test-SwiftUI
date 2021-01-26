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
    @State private var showingErrorAlert = false
    
    var body: some View {
        
        LoadingView(isShowing: .constant(giphyViewModel.isLoading)) {
            VStack(spacing: 0) {
            
            List(0 ..< giphyViewModel.gifs.count, id: \.self) { index in
                
                GiphyRowView(
                    giphyRowViewModel: GiphyRowViewModel(
                        gif: self.giphyViewModel.gifs[index],
                        self.giphyViewModel.urlSessionService)
                )
                .animation(.default)
                .onAppear() {
                    
                    if(giphyViewModel.showAlert) {
                        self.showingErrorAlert.toggle()
                        self.giphyViewModel.resetAlert()
                    }
                    
                    // Preload instead of doing it on the last cell
                    if(index == giphyViewModel.gifs.count - 2) {
                        self.giphyViewModel.loadNextGifSet()
                    }
                }
                
            }
            
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
                    self.searchTerm = ""
                }, label: {
                    Text("Search")
                        .font(Fonts.buttonFont)
                        .foregroundColor(Color.body)
                })
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            
        }
        }
        .alert(isPresented: $showingErrorAlert) {
            return Alert(
                title: Text("Loading Failed"),
                message: Text("Something went wrong whilst loading the gifs, please try again"),
                dismissButton: .default(Text("OK"))
            )
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
