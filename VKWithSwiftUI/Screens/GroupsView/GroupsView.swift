//
//  GroupsView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 24.06.2022.
//

import SwiftUI

struct GroupsView: View {
    @State private var groups: [Group] = [
        Group(name: "Movie", avatar: "group"),
        Group(name: "Music", avatar: "group"),
        Group(name: "Football", avatar: "group"),
        Group(name: "Movie", avatar: "group"),
        Group(name: "Music", avatar: "group"),
        Group(name: "Football", avatar: "group"),
        Group(name: "Cars", avatar: "group")
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name })) { group in
            GroupCell(name: group.name, avatar: group.avatar)
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
