//
//  FriendView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 23.06.2022.
//

import SwiftUI
import Kingfisher

struct PhotosView: View {
    
    private let rows: [GridItem]
    private var size: CGFloat = 80
    var id: Int
    
    @ObservedObject var viewModel: PhotoViewModel
    
    
    init(viewModel: PhotoViewModel, id: Int) {
        self.id = id
        self.viewModel = viewModel
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
                    ForEach(0..<viewModel.photos.count, id: \.self) { index in
                        KFImage(URL(string: viewModel.photos[index].imageName))
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
                .onAppear(perform: viewModel.fetch)
            }
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(viewModel: PhotoViewModel(id: 0), id: 1)
    }
}
