//
//  Response.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 27.06.2022.
//

import Foundation


struct Response<ItemsType: Decodable>: Decodable {
    let response: Items<ItemsType>
}

struct Items<ItemsType: Decodable>: Decodable {
    let items: [ItemsType]
    let count: Int?
}
