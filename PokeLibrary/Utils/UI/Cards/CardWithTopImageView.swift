//
//  CardWithTopImageView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/8/22.
//

import Foundation
import SwiftUI

public struct CardWithTopImageView<ImageView: View, Content: View>: View {
    var config: Config
    @ViewBuilder var content: Content
    @ViewBuilder var imageView: ImageView
    
    public var body: some View {
        ZStack(alignment: .top) {
            Color.clear
                .frame(height: 150)
            RoundedRectangle(cornerRadius: config.cornerRadius, style: .continuous)
                .fill(config.backgroundColor)
                .padding(.top, 40)
            VStack(alignment: .center) {
                imageView
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(config.backgroundColor, lineWidth: 10))
                
                content
                
                Spacer()
            }
            .padding(config.padding)
        }
    }
    
    public struct Config {
        var cornerRadius: CGFloat = 15
        var backgroundColor: Color = .orange
        var padding: EdgeInsets = EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
    }
}
