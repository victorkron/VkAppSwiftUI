//
//  FriendView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import SwiftUI
import ASCollectionView

struct PhotosView: View {
    @State var photos = [
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend")
    ]
    
    var body: some View {
        
        List(photos) { photo in
            Image(photo.imageName) // заглушка прототипа будующей фотографии
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(80 / 2)
                .clipped()
                .setShadow(shadowColor: .cyan, shadowRadius: 10.0)
        }
        .navigationTitle("Photos")
        
        
        
//        ASCollectionView(data: photos) { photo, context in
//            AvatarOfCell {
//                Image(photo.imageName)
//            }
//        }.layout {
//            .grid(
//                layoutMode: .fixedNumberOfColumns(2),
//                itemSpacing: 0,
//                lineSpacing: 16
//            )
//
//        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
