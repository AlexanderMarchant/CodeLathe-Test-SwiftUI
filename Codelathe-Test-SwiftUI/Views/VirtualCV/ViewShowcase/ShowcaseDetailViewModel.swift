//
//  ShowcaseDetailViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 26/01/2021.
//

import Foundation
import SwiftUI

public class ShowcaseDetailViewModel: ObservableObject {
    
    let showcase: GalleryShowcase
    let urlSessionService: UrlSessionServiceProtocol
    
    @Published var displayImageData = Data()
    
    init(
        showcase: GalleryShowcase,
        _ urlSessionService: UrlSessionServiceProtocol) {
        
        self.showcase = showcase
        self.urlSessionService = urlSessionService
        
        downloadProjectImage()
        
    }
    
    func downloadProjectImage() {
        
        guard let url = URL(string: self.showcase.displayImageUrl) else {
            return
        }
        
        urlSessionService.downloadImage(from: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.displayImageData = data
            }
        }
    }
    
    func openProjectLink() {
        if let url = showcase.projectLink {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}
