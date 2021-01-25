//
//  GiphyRowViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

public class GiphyRowViewModel: ObservableObject {
    
    let gif: Gif
    let urlSessionService: UrlSessionServiceProtocol
    
    @Published var gifData = Data()
    
    init(
        gif: Gif,
        _ urlSessionService: UrlSessionServiceProtocol) {
        
        self.gif = gif
        self.urlSessionService = urlSessionService
        
        downloadGif()
    }
    
    func downloadGif() {
        
        guard let url = self.gif.gifUrl else {
            print("No gif url...")
            return
        }
        
        urlSessionService.downloadImage(from: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.gifData = data
            }
        }
    }
}
