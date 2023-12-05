//
//  scenarioPageTask5.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 23/11/2023.
//

import SwiftUI

struct scenarioPageTask5: View {
    @State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String = "Prepare, Decoders, for the Binary Battle awaits.In this realm  of zeros and ones, Decode my binary message to reveal a seven-letter word. Your coding prowess is your weapon, let the unraveling begin. Type the decrypted word to unlock the secrets within the domain."
    
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
    var body: some View {
        
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)

            VStack {
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
                GeometryReader { geometry in
                    ZStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(white: 1, opacity: 0.14))
                                .padding([.leading, .trailing]) // Adjust padding as needed
                                .frame(width: geometry.size.width, height: geometry.size.height + 40)

                        VStack{
                            HStack{
                                frameStruct(someText: " ", binary: "01010000")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01101000")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01101111")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01100101")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01101110")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01101001")
                            }
                            HStack{
                                frameStruct(someText: " ", binary: "01111000")
                            }
                            .padding(.bottom)

                        }
                        
                    }
                        .offset(y: -(geometry.size.height / 2.3))  // Adjust the value based on how much you want to lift it up
                }
                    
                    
                    
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .offset(y:130)
                            .allowsHitTesting(false)  // Disable user interaction

                            
                }
            }
            .contentShape(Rectangle())
        }
    }
    
    

}



#Preview {
    scenarioPageTask5()
}


extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
