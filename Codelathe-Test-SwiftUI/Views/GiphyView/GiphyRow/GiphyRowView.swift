//
//  GiphyRowView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct GiphyRowView: View {
    
    @ObservedObject var giphyRowViewModel: GiphyRowViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack(alignment: .center, spacing: 15) {
                
                if let gifUrl = giphyRowViewModel.gif.gifUrl {
                    
                    AnimatedImage(url: URL(string: gifUrl)!)
                        .resizable()
                        .placeholder(UIImage(named: "image-not-found"))
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.top)
                    
                } else {
                    Image(uiImage: UIImage(imageLiteralResourceName: "image-not-found"))
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.top)
                }
            }
            
            HStack(spacing: 15) {
                
                // Showing downloading of image myself and not through SDWebImageSwiftUI
                Image(uiImage: (giphyRowViewModel.gifData.isEmpty) ? UIImage(imageLiteralResourceName: "image-not-found") : UIImage(data: giphyRowViewModel.gifData)!)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    CLHeaderTextView(text: giphyRowViewModel.gif.title)
                    HStack {
                        CLSubHeaderTextView(text: "Posted By:")
                        CLBodyTextView(text: giphyRowViewModel.gif.username)
                    }
                }
            }
            HStack(spacing: 15) {
                CLSubHeaderTextView(text: "Trending On:")
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
                            title: "Testing a long title to see what happens so that i can make changes as needed",
                            sourceUrl: "Test Source URL",
                            markedTrending: "Test Trending",
                            username: "Test Username"),
                        UrlSessionService()))
    }
}
