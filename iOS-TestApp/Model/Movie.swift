//
//  Film.swift
//  iOS-TestApp
//
//  Created by Aleksandr Morozov on 16.04.2022.
//

import Foundation

struct Movies: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let original_language: String
    let overview: String
    let original_title: String
    let poster_path: String
    let title: String
}

 
