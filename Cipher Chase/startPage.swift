//
//  startPage.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 26/11/2023.
//

import SwiftUI

struct startPage: View {
    
    //@State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String = "In the dark corners of the digital world, an enigmatic figure known as The Encoder has infiltrated a renowned coding academy, leaving a trail of corrupted programs and vanished data. \n The academy, seeking the help of the most skilled coders, assembles a team of elite programmers to unravel the mystery behind The Encoder's malicious activities."
    
    
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.1
    
    
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
    
    @State private var showText = false
    @State private var showButton = false

    
    func startPopUpAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
            self.showText.toggle()
        }
    }
    
    var body: some View {
        
        ZStack{
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                GeometryReader { geometry in
                    
                    Text(animateTitle)
                        .font(Font.custom("PixelifySans-Bold", size: 16))
                        .padding(.horizontal)
                        .padding(.top, geometry.safeAreaInsets.top) // Adjust for top safe area
                        .padding([.leading, .trailing]) // Adjust padding as needed
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    
                    
                } // Geometry reader
                
                Spacer()
                
                    VStack{
                        
                        if showText {

                        Text("Are \nYou \nReady \nTo Start?")
                            .padding()
                            .font(Font.custom("PixelifySans-Bold", size: 30))
                            .foregroundColor(.logocolor)
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .transition(.opacity) // Apply a transition effect
                            .onAppear{
                                startPopUpAnimation() // Start the pop-up animation
                            }

                    }//if
                    
                        Button("     Start    "){
                        }
                        .buttonStyle(BlueButton())
                        
                }//Vstack
                
                Spacer()
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                
            }
            .onAppear {
                startAnimation() // Start the initial animation
                //startPopUpAnimation() // Start the pop-up animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 33.5) { // Change the delay as needed
                    showText = true
                }
            }
        }//VStack
        
    }//ZStack
}


#Preview {
    startPage()
}
