//
//  TabBar.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 24.06.2022.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectionView = 1
    
    private var navTitleName = ["Friends", "Groups"]
    
    var body: some View {
        TabView(selection: $selectionView) {
            FriendsView()
                .tabItem {
                    Image(systemName: "person.3.sequence")
                }.tag(1)
            GroupsView()
                .tabItem {
                    Image(systemName: "rectangle.3.group")
                }.tag(2)
        }.navigationTitle(navTitleName[selectionView - 1])
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
