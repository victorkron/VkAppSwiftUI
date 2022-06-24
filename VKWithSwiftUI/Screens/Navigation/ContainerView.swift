//
//  ContainerView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var showFriends = false
    
    var body: some View {
            NavigationView {
                HStack {
                    LoginView(isUserLoggedIn: $showFriends)
                    NavigationLink(
                        destination: TabBar(),
                        isActive: $showFriends
                    ) {
                        EmptyView()
                    }
                }
            }
    }
}


struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
