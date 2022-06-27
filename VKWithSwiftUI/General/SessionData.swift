//
//  SessionData.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 27.06.2022.
//

import Foundation

final class SessionData  {
    var token: String = ""
    var userId: Int = 0
    
    static let data = SessionData()
    
    private init() {}
}
