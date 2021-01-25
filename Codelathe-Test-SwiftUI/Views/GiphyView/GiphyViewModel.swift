//
//  GiphyViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

public class GiphyViewModel: ObservableObject {
    
    let giphyService: GiphyServiceProtocol
    
    @Published var gifs = [Gif]()
    
    init(_ giphyService: GiphyServiceProtocol) {
        self.giphyService = giphyService
    }
}
