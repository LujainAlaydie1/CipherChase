//
//  crosswordTask1.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 27/11/2023.
//

import SwiftUI

struct crosswordTask1: View {
    
    @State var one: String = "1"
    @State var zero: String = "0"
    @State var answr: String = " "
    @State var answr1: String = "5"
    @State var answr2: String = "7"
    @State var answr3: String = "9"
    
    @State var animateTitle: String = ""
    @State var finalText: String = "In the realm of binary enigmas, the key lies in simplicity. Decode the binary sequence and distill it down to two digits. Unravel the essence of the code, and you'll find the gateway to the heart of logic."
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    
    func startAnimation(){
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            if indexValue < finalText.count{
                animateTitle += String(finalText[finalText.index(finalText.startIndex,offsetBy: indexValue)])
                indexValue += 1
            }else{
                timer.invalidate()
            }
        }
    }
    
    var body: some View {
        
        ZStack{
            
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: -20){
                
                GeometryReader { geometry in
                    Text(animateTitle)
                        .font(Font.custom("PixelifySans-Bold", size: 16))
                        .padding(.horizontal)
                        .padding(.top, geometry.safeAreaInsets.top) // Adjust for top safe area
                        .padding([.leading, .trailing]) // Adjust padding as needed
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .onAppear{
                            startAnimation()
                        }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(white: 1, opacity: 0.14))
                        .padding([.leading, .trailing], -3)
                        //.padding(.top, 100)
                        .frame(width: 350 , height: 400) //height 400 fixes the text, og is 500
                    
                    VStack{
                        VStack{
                            
                            HStack{
                                crosswordBlock(text: $one)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                crosswordBlock(text: $zero)
                                crosswordBlock(text: $one)
                                crosswordBlock(text: $zero)
                                crosswordBlock(text: $one)
                                Text("=")
                                    .font(Font.custom("AnonymousPro-Bold", size: 35))
                                    .fontWeight(.bold)
                                    .foregroundColor(.logocolor)
                                crosswordBlock(text: $answr)
                            }
                            
                            HStack{
                                crosswordBlock(text: $zero)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                crosswordBlock(text: $one)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                Text("=")
                                    .padding(.trailing, 30)
                                    .font(Font.custom("AnonymousPro-Bold", size: 35))
                                    .fontWeight(.bold)
                                    .foregroundColor(.logocolor)
                            }
                            
                            HStack{
                                crosswordBlock(text: $answr)
                                    .padding(.trailing, 30)                            }
                            //.padding(.bottom, 100)
                        }//VStack
                        //.padding(.bottom, -100)
                        
                        
                        
                        
                    }//VStack
                }//ZStack
                
                
                Spacer()
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
            }//VStack
            
            HStack(spacing: 30){
                    crosswordBlock(text: $answr1)
                    crosswordBlock(text: $answr2)
                    crosswordBlock(text: $answr3)
                }
            .padding(.trailing, 30)
            .padding(.horizontal) // Add horizontal padding for spacing on the sides
            .padding(.top, 600) // Add bottom padding to the HStack

        } // ZStack
    }
}

struct crosswordBlock: View{
    
    @Binding var text: String
    
    var body: some View{
        Text(text)
            .font(Font.custom("AnonymousPro-Bold", size: 35)) //"AnonymousPro-Bold" or "PixelifySans-Bold"
            .padding()
            .foregroundColor(.black)
            .frame(width: 50, height: 50)
            .background(Color.white)
            .cornerRadius(7)
    }
}

#Preview {
    crosswordTask1()
}
