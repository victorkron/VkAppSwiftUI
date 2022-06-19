//
//  FriendCell.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 19.06.2022.
//

import SwiftUI

struct FriendCell: View {
    var body: some View {
        HStack {
            AvatarOfCell {
                Image("friend")
            }
//            .alignmentGuide(VerticalAlignment.center) { $0[.bottom] }
//            .alignmentGuide(HorizontalAlignment.center) { $0[.trailing] }
            
            Text("John Wick")
                .font(.title)
                .padding(.leading, 20)
                .lineLimit(1)
//                .alignmentGuide(VerticalAlignment.center) { $0[.bottom] }
//                .alignmentGuide(HorizontalAlignment.center) { $0[.leading] }
        }
        .padding()
    }
}

struct FriendsCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell()
    }
}