//
//  crosswordStruct.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 28/11/2023.
//


import Foundation
import SwiftUI
struct crosswordBlock: View {
    
    @Binding var text: String
    @Binding var someText: String
    var correctLetter: String
    var correctPosition: Int
    @State private var isCorrect: Bool = false
    @Binding var enteredLetters: [String]
    var x: Bool
    
    var body: some View {
        if x {
            GeometryReader { geometry in
                Text(text)
                    .font(Font.custom("AnonymousPro-Regular", size: 32))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(Color.white)
                    .cornerRadius(7)
                    .overlay(
                        TextField("   ", text: $someText)
                            .foregroundColor(isCorrect ? .black : .red)
                            .padding([.leading], (geometry.size.width * 2) / 5)
                            .padding(.top)
                            .font(Font.custom("AnonymousPro-Regular", size: 32))
                            .keyboardType(.numberPad)
                            .onChange(of: someText) {
                                limitToOneDigit()
                                updateCorrectness()
                            }
                    )
            }
        } else {
            GeometryReader { geometry in
                Text(text)
                    .font(Font.custom("AnonymousPro-Regular", size: 32))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(Color.white)
                    .cornerRadius(7)
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
