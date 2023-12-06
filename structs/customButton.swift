//
//  customButton.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 28/11/2023.
//

import SwiftUI

struct CustomButton: View {
    var text : String
    var action: () -> Void
    var body: some View {
        Button(text, action: {
            action()
        })
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.cyan, lineWidth: 1)
        )
        .buttonStyle(MyButtonStyle())
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
