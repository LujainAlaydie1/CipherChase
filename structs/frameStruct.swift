//
//  frameStruct.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 24/11/2023.
//

import SwiftUI

struct frameStruct: View {
    @Binding var someText: String
    @State var binary: String
    var correctLetter: String
    var correctPosition: Int
    @State private var isCorrect: Bool = false
    @Binding var enteredLetters: [String]
    var body: some View {
        
        HStack{
            GeometryReader { geometry in
                    Text(binary)
                        .font(Font.custom("AnonymousPro-Regular", size: 32))
                        .foregroundColor(.white)
                        .padding([.trailing, .top]) // Adjust padding as needed
                        .padding(.leading, (geometry.size.width) / 9)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding([.leading], (geometry.size.width * 3) / 4)
                        .padding(.top)
                        .overlay(
                            TextField("   ", text: $someText)
                                .foregroundColor(isCorrect ? .black : .red)
                                .padding([.leading], (geometry.size.width * 3) / 4 + 15)
                                .padding(.top)
                            
                                .onChange(of: someText) {
                                    limitToOneDigit()
                                    updateCorrectness()
                                }
                            
                        )
                }
        }
        
        
        
    }
    
    private func updateCorrectness() {
        isCorrect = enteredLetters[correctPosition] == correctLetter
    }

    private func limitToOneDigit() {
        if someText.count > 1 {
            someText = String(someText.prefix(1))
        }
    }
}

