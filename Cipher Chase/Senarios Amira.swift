//
//  Senario 1 Amira.swift
//  Cipher Chase
//
//  Created by AMIRA on 13/05/1445 AH.
//

import SwiftUI

struct Senario_1_Amira: View {
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
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
The team quickly realizes that "2572" is the key to unlocking the puzzle.
With the correct solution in mind, they interact with the holographic puzzle, inputting "2572" in the lock. The holographic door shimmers, and with a soft click, it swings open, granting access to the secret area beyond.
"""
    
     let secondFianl = """
Inside the secret room, the atmosphere changes. Glowing terminals line the walls, each displaying encrypted files. The holographic map updates once again, pinpointing a particular encrypted file containing crucial information about The Encoder and their next move.
"Well done, Codebreakers! Your mastery of ciphers has granted you access to the vault of knowledge. Dive into the encrypted files, and the identity of The Encoder shall be revealed, along with their plans for the academy."
The elite coding team, fueled by determination, begins deciphering the encrypted files, uncovering the mysteries that will guide them through the next phase of their mission. The virtual room echoes with the hum of decryption, signaling that the answers they seek are within their grasp.
"""
    
    let thirdFinal = """
As the elite coding team delves into the encrypted files within the secret room, they discover a trove of information. The holographic terminals display intricate lines of code, each requiring their expert decoding skills.
The holographic map pinpoints a specific encrypted file labeled "Project_Phoenix." Intrigued, the team focuses their attention on decrypting this file, knowing it holds the key to understanding The Encoder's grand plan.
"""
    let forthFinal = """
The encrypted file appears as a complex algorithm, interweaving binary, hexadecimal, and intricate patterns. The holographic message materializes:
    "The Phoenix rises in the realm of logic. Crack the code, unveil its wings, and the truth shall soar."
    The team understands that deciphering this file is critical to uncovering The Encoder's next move. With each successful decryption, fragments of The Encoder's identity and their motives come to light.
     
"""
    
    @State var buttonText = "Next"
    
    var body: some View {
        if  self.navigateToNextView{
            SplashScreen()
            //related to maha's pages.
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
                                                    Inside the secret room, the atmosphere changes. Glowing terminals line the walls, each displaying encrypted files. The holographic map updates once again, pinpointing a particular encrypted file containing crucial information about The Encoder and their next move.
                                                    "Well done, Codebreakers! Your mastery of ciphers has granted you access to the vault of knowledge. Dive into the encrypted files, and the identity of The Encoder shall be revealed, along with their plans for the academy."
                                                    The elite coding team, fueled by determination, begins deciphering the encrypted files, uncovering the mysteries that will guide them through the next phase of their mission. The virtual room echoes with the hum of decryption, signaling that the answers they seek are within their grasp.
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
                                                    self.buttonText = "Next"
                                                    // Add your custom action here
                                                case 3:
                                                    // Action for the second click
                                                    self.finalText = forthFinal
                                                    print(self.finalText)
                                                    self.animateTitle = ""
                                                    self.indexValue = 0
                                                    self.startAnimation()
                                                    self.buttonText = "Next"
                                                    // Add your custom action here
                                                    
                                                case 4:
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
            
        }
        }
    }

#Preview {
    Senario_1_Amira()
}
