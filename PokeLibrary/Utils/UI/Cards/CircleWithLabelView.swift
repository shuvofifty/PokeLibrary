//
//  CircleWithLabelView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/8/22.
//

import Foundation
import SwiftUI

public struct CircleWithLabelView<ImageView: View, LabelView: View>: View {
    var config: Config
    @ViewBuilder var imageView: ImageView
    @ViewBuilder var labelView: LabelView
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            imageView
                .padding(config.imageInnerPadding)
                .clipShape(Circle())
                .overlay(Circle().stroke(config.colors.imageBorderColor, lineWidth: 5))
                .padding(config.imagePadding)
            labelView
                .padding(config.labelPadding)
                .background(config.colors.labelBackgroundColor)
                .foregroundColor(config.colors.labelTextColor)
        }
    }
    
    public struct Config {
        var labelPadding: EdgeInsets = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        var imagePadding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        var imageInnerPadding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        var colors: ViewColor = ViewColor()
        
        public struct ViewColor {
            var imageBorderColor: Color = .orange
            var labelBackgroundColor: Color = .orange
            var labelTextColor: Color = .white
        }
        
    }
}
