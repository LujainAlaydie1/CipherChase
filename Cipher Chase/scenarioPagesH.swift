//
//  scenarioPagesH.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 05/12/2023.
//

import SwiftUI
import Combine


struct scenarioPagesH: View {
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    private var cancellables: Set<AnyCancellable> = []
    @State private var clickCount = 0
    
    @SceneStorage("currentPage") var currentPage: String?


    @State private var navigateToNextView = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()

    
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
    
    
    @State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String =  "As the Elite Coding Team steps into the virtual lobby of the coding academy, they are greeted by the faint humming of servers and the glow of neon code scrolling across digital billboards. In the center of the lobby lies an unassuming laptop, its screen displaying a mysterious message: \"Cracked minds seek truth, but only those with the code can reveal it. Your journey begins here, Unlock the secrets within\""
    
     let secondFianl = "The laptop seems to be the first puzzle left by The Encoder. As the players approach, they notice the laptop is pin-protected, and a digital timer starts counting down. It's a race against the clock. The room is filled with holographic displays of code snippets and flickering neon lights. The players spot a holographic note on the floor, revealing a riddle."

    
    @State var buttonText = "Next"
    
    
    var body: some View {
        if  self.navigateToNextView{
            crosswordTask1()
        }else{
            NavigationStack(path: $path) {
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
                            
                        } /// here!
                        
                        Spacer()
                        
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                    }
                    
                    HStack {
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                                .padding([.leading, .trailing], geometry.size.width / 3)
                                .padding(.top, geometry.size.height / 1.1)
                                .foregroundColor(.secondarys)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                                        .padding([.trailing], geometry.size.width / 44)
                                        .padding(.top, geometry.size.height / 1.12)
                                        .foregroundColor(.accents)
                                        .overlay{
                                            Button(action: {
                                                self.clickCount += 1
                                                
                                                // Perform different actions based on the click count
                                                switch self.clickCount {
                                                case 1:
                                                    self.finalText = ""
                                                    self.finalText = """
                                                    With unwavering determination, the elite coding team delves into the master code. As each line unravels, a revelation emerges. The identity of The Encoder is unveiled, and the virtual realm trembles with the triumph of the Decoders.
                                                    In a dazzling display, the virtual realm transforms. The servers hum in harmony, glitches dissipate, and the academy's digital core pulses with newfound stability. The mission is complete, and the coding academy is saved from the grasp of The Encoder.
                                                    """

                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                        self.animateTitle = ""
                                                        self.indexValue = 0
                                                        self.startAnimation()
                                                    }
                                                    self.buttonText = "Solve"
                                                    // Add your custom action here
                                                    
                                                case 2:
                                                    // Action for the second click
                                                    navigateToNextView = true
                                                    // Add more cases for additional clicks if needed
                                                    
                                                    
                                                default:
                                                    // Default action for subsequent clicks
                                                    print("Clicked again!")
                                                    // Add your default action here
                                                }
                                            }) {
                                                Text(buttonText)
                                                    .font(Font.custom("PixelifySans-Bold", size: 22))
                                                    .foregroundColor(.secondarys)
                                                    .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 15)
                                                            .foregroundColor(.accents)
                                                    )
                                            }
                                            .padding([.trailing], geometry.size.width / 44)
                                            .padding(.top, geometry.size.height / 1.12)
                                            
                                        }
                                    
                                    
                                    
                                }
                        }
                    }
                }
                
                
                .contentShape(Rectangle())
            }
            .navigationBarHidden(true)  // Hide the navigation bar on this screen
            .onReceive([self.clickCount].publisher) { _ in
                // Code to execute when clickCount changes
                // You can print values or trigger animations here
                print("Click count: \(clickCount)")
            }
            .onAppear {
                UserDefaults.standard.set("scenarioPagesH", forKey: "leftOff")

            }


        }

        }
}

#Preview {
    scenarioPagesH()
}
