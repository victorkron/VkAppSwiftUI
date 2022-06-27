//
//  Photo.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import Foundation

class Photo: Identifiable {
    
    let id: UUID = UUID()
    let imageName: String
    
    /*internal*/ init(imageName: String) { // internal - внутри исходного модуля
        self.imageName = imageName
    }
}


import Foundation
import UIKit

struct PhotosResponse {
    let response: Photos
}

extension PhotosResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Photos {
    let count: Int
    let items: [Albums]
    
}

extension Photos: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}

struct Albums {
    let sizes: [PhotoData]
//    let likes: Likes
    let ownerID: Int

}

extension Albums: Codable {
    enum CodingKeys: String, CodingKey {
        case sizes
//        case likes
        case ownerID = "owner_id"
    }
}

struct PhotoData {
    let width: Int
    let height: Int
    let url: String
    let type: String
    
    var aspectRatio: CGFloat { return CGFloat(height)/CGFloat(width) }
}

extension PhotoData: Codable {
    enum CodingKeys: String, CodingKey {
        case width
        case height
        case url
        case type
    }
}



