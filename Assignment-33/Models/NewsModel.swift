//
//  NewsModel.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 27.12.23.
//

import Foundation

// MARK: - NewsModel
struct NewsData: Decodable {
    let offset: Int
    let number: Int
    let available: Int
    let news: [News]
}

// MARK: - News
struct News: Decodable, Identifiable {
    let id: Int
    let title: String
    let text: String
    let url: String
    let image: String
    let publishDate: String
    let author: String
    let authors: [String]
    let language: String
    let sourceCountry: String
    let sentiment: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, text, url, image
        case publishDate = "publish_date"
        case author, authors, language
        case sourceCountry = "source_country"
        case sentiment
    }
}
