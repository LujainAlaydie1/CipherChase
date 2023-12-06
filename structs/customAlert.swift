//
//  customAlert.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 28/11/2023.
//
import Foundation
import SwiftUI

struct CustomAlert: View{
    @Binding var textFieldValue: String
    @Binding var showAlertWithTextField : Bool
    @State var showError: Bool = false
    var title: String
    var placeholder: String
//    var handler : () -> Void
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            
            if showAlertWithTextField{
                VStack {
                    VStack{
                        Text(title).padding(5)
                        TextField(placeholder, text: $textFieldValue)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.cyan, lineWidth: 1)
                            )
                            .onChange(of: textFieldValue) { newValue in
                                showError = false
                            }
                        
                        Spacer(minLength: 25)
                        HStack{
                            CustomButton(text: "Cancel") {
                                showAlertWithTextField.toggle()
                                textFieldValue = ""
                            }
                           
                            Spacer()

                            CustomButton(text: "Done"){
                                if textFieldValue.count > 0{
//                                    handler()
                                    textFieldValue = ""
                                    showAlertWithTextField.toggle()
                                }else{
                                    showError = true
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
               

                if showError{
                    HStack{
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(Color.red)
                            .padding(4)
                        Text("Insert text")
                            .padding(4)
                            .font(.custom("ArialRoundedMTBold", size: 14))
                            .foregroundColor(Color.red)
                    }
                    
                }
            }
        }
       
        .frame(width: 300, height: 180)
        .cornerRadius(20).shadow(color: .cyan, radius: 8)
        .foregroundColor(Color.cyan)
       
    }
}
