//
//  ChuckRequest.swift
//  search
//
//  Created by William Lennartsson on 2020-02-02.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

import Foundation

struct ChuckRequest {
    let resourceURL: URL
    let baseURL: String = "https://api.chucknorris.io/jokes"
    
    init() {
        let urlString = "\(baseURL)/random"
        guard let url = URL(string: urlString) else { fatalError() }
        self.resourceURL = url
        
    }
    
    func fetchJoke(completion: @escaping(Result<ChuckJoke, Error>) -> Void) {
        print("Fetching joke...")
        let task = URLSession.shared.dataTask(with: resourceURL) { (data, _, error) in
            print("Response")
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                print("We have data")
                do {
                    let decoder = JSONDecoder()
                    let joke = try decoder.decode(ChuckJoke.self, from: data)
                    completion(.success(joke))
                } catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        let a = (1, 4, "hej")
        
        let (b, c, d    ) = a
    }
}
