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
