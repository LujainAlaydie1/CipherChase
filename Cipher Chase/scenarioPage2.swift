//
//  scenarioPage2.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 05/12/2023.
//

import SwiftUI

struct scenarioPage2: View {
    
    @State var animateTitle: String = ""
    @State var finalText: String = "The laptop seems to be the first puzzle left by The Encoder. As the players approach, they notice the laptop is pin-protected, and a digital timer starts counting down. It's a race against the clock. The room is filled with holographic displays of code snippets and flickering neon lights. The players spot a holographic note on the floor, revealing a riddle."
    
    
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
                
                Button("      Solve     "){}
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
    scenarioPage2()
}
