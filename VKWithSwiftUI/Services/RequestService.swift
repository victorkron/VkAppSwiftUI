//
//  RequestService.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 27.06.2022.
//

import Foundation

enum requestType {
    case friends
    case groups
    case photos
    case searchGroups
    case feed
}

protocol RequestService {
    associatedtype Element
    func fetch(type: requestType, str: String?, id: Int?, complition: @escaping (Swift.Result<Element, Error>) -> Void)
}
