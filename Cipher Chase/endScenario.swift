//
//  endScenario.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 25/11/2023.
//

import SwiftUI
import Combine

struct endScenario: View {
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    private var cancellables: Set<AnyCancellable> = []
    @State private var clickCount = 0

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
    @State var finalText: String =  """
    The elite coding team, undeterred by The Encoder's ominous challenge, engages in the Binary Battle. The holographic display flickers, revealing a complex binary sequence.

    "Decipher this seven-letter code, Decoders. In its essence lies the key to The Phoenix's true nature."

    Fingers dance over keyboards, decoding the binary puzzle. As the final letter falls into place, the room trembles. 
The holographic projection of The Encoder reacts, sinister laughter replaced by an unsettling silence.

    Success opens a virtual doorway, transporting the team to the final confrontation in the heart of the virtual realm.

 Towering lines of code surround them, forming The Encoder's master code. The challenge is set: decipher this code, unveil The Encoder's identity, and save the coding academy.
"""
    
     let secondFianl = """
With unwavering determination, the elite coding team delves into the master code. As each line unravels, a revelation emerges. The identity of The Encoder is unveiled, and the virtual realm trembles with the triumph of the Decoders.
In a dazzling display, the virtual realm transforms. The servers hum in harmony, glitches dissipate, and the academy's digital core pulses with newfound stability. The mission is complete, and the coding academy is saved from the grasp of The Encoder.
"""
    
    let thirdFinal = """
The holographic map updates one last time, displaying a message of triumph: "Codebreakers, you have restored balance to the digital realm. The academy is secure, and your coding legacy lives on."

The virtual doorway closes behind them, leaving the elite coding team standing in the now serene virtual environment. The echoes of their success resonate, marking the end of their epic journey to safeguard the coding academy.

"""
    
    @State var buttonText = "Next"
    @EnvironmentObject var router: Router

    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        GeometryReader { geometry in
                            Text(animateTitle)
                                .font(Font.system(size: 16))
                                .padding(.horizontal)
                                .padding(.top, geometry.safeAreaInsets.top) // Adjust for top safe area
                                .padding([.leading, .trailing]) // Adjust padding as needed
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .offset(y: -60)
                                .onAppear{
                                    startAnimation()
                                }
                            
                        } /// here!
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
                                              
                                                    // Add your custom action here
                                                    
                                                case 2:
                                                    // Action for the second click
                                                    self.finalText = thirdFinal
                                                    print(self.finalText)
                                                    self.animateTitle = ""
                                                    self.indexValue = 0
                                                    self.startAnimation()
                                                    self.buttonText = "End"
                                                    // Add your custom action here
                                                    
                                                    
                                                case 3:
                                                    router.navigateToRoot()
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
                                    
                                    
                                    Image("ones")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                        .offset(y:250)
                                        .allowsHitTesting(false)  // Disable user interaction
                                    
                                    
                                    
                                    
                                }
                        }
                    }
                }
                
                
                .contentShape(Rectangle())
            
            .onReceive([self.clickCount].publisher) { _ in
                // Code to execute when clickCount changes
                // You can print values or trigger animations here
                print("Click count: \(clickCount)")

            }
            .onAppear {
                UserDefaults.standard.set("endScenario", forKey: "leftOff")
                    }
        
            .navigationBarBackButtonHidden()

            .toolbar {
 
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.navigateToRoot()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
            }

            
        
        
            
        }
    }


#Preview {
    endScenario()
}
