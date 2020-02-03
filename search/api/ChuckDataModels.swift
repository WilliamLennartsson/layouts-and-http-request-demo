//
//  ChuckDataModels.swift
//  search
//
//  Created by William Lennartsson on 2020-02-02.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

import Foundation

struct ChuckJoke: Decodable {
    let id: String
    let categories: [String]
    let value: String
}

