//
//  AvatarOfCell.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 19.06.2022.
//

import SwiftUI
import Kingfisher

struct AvatarOfCell: View {
    var content: KFImage
    private var size = 70.0 
    
    init(@ViewBuilder content: () -> KFImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
            .clipped()
            .setShadow(shadowColor: .cyan, shadowRadius: 10.0)
    }
    
}

struct CustomShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(
                        color: shadowColor,
                        radius: shadowRadius
                    )
            )
    }
}

extension View {
    func setShadow(shadowColor: Color, shadowRadius: CGFloat) -> some View {
        return self.modifier(CustomShadow(shadowColor: shadowColor, shadowRadius: shadowRadius))
    }
}
