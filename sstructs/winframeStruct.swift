//
//  winframeStruct.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 25/11/2023.
//

import SwiftUI

struct winframeStruct: View {
    @Binding var someText: String
    @State var binary: String
    var correctLetter: String
    var body: some View {
        
        HStack{
            GeometryReader { geometry in
                    Text(binary)
                        .font(Font.custom("AnonymousPro-Regular", size: 16))
                        .foregroundColor(.white)
                        .padding([.trailing, .top]) // Adjust padding as needed
                        .padding(.leading, (geometry.size.width) / 3)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 20, height: 20)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding([.leading], (geometry.size.width * 3) /  5)
                        .padding(.top)
                        .overlay(
                            TextField("   ", text: $someText)
                                .foregroundColor(.black)
                                .padding([.leading], (geometry.size.width * 3) / 5 + 5)
                                .padding(.top)
                                .onChange(of: someText) {
                                    if someText.count > 1 {
                                        someText = String(someText.prefix(1))
                                    }
                                }
                            
                        )
                }
        }       
        
    }
}

