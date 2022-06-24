//
//  FriendsView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var friends: [Friend] = [
        Friend(name: "John", avatar: "friend"),
        Friend(name: "Lisa", avatar: "friend"),
        Friend(name: "Smith", avatar: "friend"),
        Friend(name: "Nicole", avatar: "friend")
    ]
    
    var body: some View {
        List(friends.sorted(by: { $0.name < $1.name })) { friend in
            NavigationLink(destination: PhotosView()) {
                FriendCell(name: friend.name, avatar: friend.avatar)
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
