//
//  FriendViewModel.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 27.06.2022.
//

import Foundation

class FriendViewModel: ObservableObject { // Отображаемый город
//    let city: City
    
    @Published var friends: [Friend] = []
    
//    init(city: City) {
//        self.city = city
//    }
    
    public func fetch() {
        Request<User>().fetch(
            type: .friends
        ) { [weak self] result in
            switch result {
            case let .success(myFriends):
                
                let items = myFriends.map { item in
                    Friend(
                        name: "\(item.lastName) \(item.firstName)",
                        avatar: item.photo,
                        id: item.id
                    )
                }
                DispatchQueue.main.async {
                    self?.friends = items
                }
                
                
            case let .failure(error):
                print(error)
                
            }
        }
    }
    
}
