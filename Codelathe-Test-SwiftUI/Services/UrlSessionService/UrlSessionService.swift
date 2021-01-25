//
//  UrlSessionService.swift
//  CodeLathe-Test
//
//  Created by Alex Marchant on 15/01/2021.
//

import Foundation

protocol UrlSessionServiceProtocol {
    func downloadImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

class UrlSessionService: UrlSessionServiceProtocol {
    
    init() {}
    
    func downloadImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
