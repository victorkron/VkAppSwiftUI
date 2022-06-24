//
//  FriendView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import SwiftUI
import ASCollectionView

struct PhotosView: View {
    
    private let rows: [GridItem]
    private var size: CGFloat = 80
    
    @State var photos = [
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend"),
        Photo(imageName: "friend")
    ]
    
    init() {
        rows = [
            GridItem(.fixed(self.size)),
            GridItem(.fixed(self.size)),
            GridItem(.fixed(self.size))
        ]
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<photos.count, id: \.self) { index in
                        Image(photos[index].imageName) // заглушка прототипа будующей фотографии
                            .resizable()
                            .frame(width: size, height: size)
                            .cornerRadius(size / 2)
                            .clipped()
                            .setShadow(shadowColor: .cyan, shadowRadius: 10.0)
                            .padding(10)
                    }
                }.frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
            }
            
        }
    }

        
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


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
