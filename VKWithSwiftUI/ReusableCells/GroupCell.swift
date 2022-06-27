//
//  GroupCell.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 19.06.2022.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    let name: String
    let avatar: String
    
    var body: some View {
        HStack {
            AvatarOfCell {
                KFImage(URL(string: avatar))
            }
            Text(name)
                .font(.title)
                .padding(.leading, 20)
                .lineLimit(1)
                .layoutPriority(1)
        }
        .padding()
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(name: "name", avatar: "group")
    }
}
