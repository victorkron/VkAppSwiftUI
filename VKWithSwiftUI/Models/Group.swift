//
//  Group.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 24.06.2022.
//

import Foundation

class Group: Identifiable {
    let id: UUID = UUID()
    let name: String
    let avatar: String
    
    /*internal*/ init(name: String, avatar: String) { // internal - внутри исходного модуля
        self.name = name
        self.avatar = avatar
    }
}
