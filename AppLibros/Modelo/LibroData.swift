//
//  LibroData.swift
//  AppLibros2
//
//  Created by Saúl Pérez on 04/02/22.
//

import Foundation

//struct LibroData: Decodable{
//    let title: String?
//    let authors: String?
//    let publishedDate: String?
//    let categories: String?
//    let thumbnail : String?
//    let description: String?
//
//}

// MARK: - LibroData
struct LibroData: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let volumeInfo: VolumeInfo
    let searchInfo: SearchInfo?
}


// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publishedDate: String
    let categories: [String]?
    let imageLinks: ImageLinks?
    let description: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

