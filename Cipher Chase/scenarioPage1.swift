//
//  scenarioPage1.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 05/12/2023.
//

import SwiftUI

struct scenarioPage1: View {
    
    @State var animateTitle: String = ""
    @State var finalText: String = "As the Elite Coding Team steps into the virtual lobby of the coding academy, they are greeted by the faint humming of servers and the glow of neon code scrolling across digital billboards. In the center of the lobby lies an unassuming laptop, its screen displaying a mysterious message: \"Cracked minds seek truth, but only those with the code can reveal it. Your journey begins here, Unlock the secrets within\""
    
    
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
            
            VStack{
                
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
                        
                    
                    
                } // Geometry reader
                
                Button("      Next     "){}
                .buttonStyle(BlueButton())
                .padding(.top)
                
                Spacer()
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .zIndex(-1)
            }
        }
    }
}

#Preview {
    scenarioPage1()
}
