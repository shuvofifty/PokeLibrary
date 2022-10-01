//
//  PrimaryButton.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/30/22.
//

import Foundation
import SwiftUI

fileprivate struct TestUIButton: View {
    var body: some View {
        VStack {
            Button("String") {
                
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button("String") {
                
            }
            .buttonStyle(SecondaryButtonStyle())
            
            
            Button("String") {
                
            }
            .buttonStyle(TertiaryButtonStyle())
        }
        
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        TestUIButton()
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
            .background(.black)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(PokeFont.shared.globalFont(16).bold())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    private let borderWidth: CGFloat = 3
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
            .background(.clear)
            .foregroundColor(.black)
            .overlay(Capsule().stroke(.black, lineWidth: borderWidth))
            .padding(borderWidth/2)
            .font(PokeFont.shared.globalFont(16).bold())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct TertiaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .font(PokeFont.shared.globalFont(18).bold())
    }
}
