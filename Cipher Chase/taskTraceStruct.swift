//
//  taskTraceStruct.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 30/11/2023.
//
import Foundation
import SwiftUI

struct taskTraceStruct: View{
    
    @Binding var text: String
    @Binding var someText: String
    @State var binary: String
//    var correctLetter: String
    var x : Bool
    var body: some View{
        if x {
            GeometryReader { geometry in
                
                Text(text)
                    .font(Font.custom("AnonymousPro-Regular", size: 16))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(Color.white)
                    .cornerRadius(7)
                    .overlay(
                        TextField("   ", text: $someText)
                            .foregroundColor(.black)
                            .padding([.leading], (geometry.size.width * 2) / 5 )
                            .padding(.top)
                            .font(Font.custom("AnonymousPro-Regular", size: 35))
                            .keyboardType(.numberPad)
                            .onTapGesture {
                                someText = ""
                            }
                        
                    )
                
            }
        }else{
            GeometryReader { geometry in
                
                Text(text)
                    .font(Font.custom("AnonymousPro-Regular", size: 35))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(Color.white)
                    .cornerRadius(7)
                
                
            }
        }
    }
}
