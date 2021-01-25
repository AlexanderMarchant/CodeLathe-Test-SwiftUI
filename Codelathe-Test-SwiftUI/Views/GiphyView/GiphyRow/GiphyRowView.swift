//
//  GiphyRowView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct GiphyRowView: View {
    
    @ObservedObject var giphyRowViewModel: GiphyRowViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .center, spacing: 15) {
                
                Image(uiImage: (giphyRowViewModel.gifData.isEmpty) ? UIImage(imageLiteralResourceName: "image-not-found") : UIImage(data: giphyRowViewModel.gifData)!)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                CLSubTitleTextView(text: giphyRowViewModel.gif.title)
                    .padding(.leading, 15)
                Spacer()
            }
            
            HStack(spacing: 15) {
                CLSubHeaderTextView(text: "Posted By:")
                CLBodyTextView(text: giphyRowViewModel.gif.username)
            }
            HStack(spacing: 15) {
                CLSubHeaderTextView(text: "Tending On:")
                CLBodyTextView(text: giphyRowViewModel.gif.markedTrending)
            }
            HStack(spacing: 15) {
                CLCaptionTextView(text: giphyRowViewModel.gif.sourceUrl ?? "Source URL Unknown")
            }
        }
        .padding(.leading, 25)
        .padding(.trailing, 25)
    }
}

struct GiphyRowView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyRowView(giphyRowViewModel: GiphyRowViewModel(
                        gif: Gif(
                            gifUrl: nil,
                            title: "Test Title",
                            sourceUrl: "Test Source URL",
                            markedTrending: "Test Trending",
                            username: "Test Username"),
                        UrlSessionService()))
    }
}
