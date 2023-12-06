//
//  scenario2.swift
//  Cipher Chase
//
//  Created by Diala Masoud on 27/11/2023.
//

import SwiftUI

struct scenario2: View {
    
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
    As the elite coding team fixes the bug-infested code, a virtual doorway materializes, unlocking the next stage of their journey. The holographic map updates, marking their progress.
    "Congratulations, decoders! Your keen debugging skills restored order. The door to the next destination is open in your quest to unveil academy mysteries."
    The map reveals the "Logic Labyrinth." The team steps through the virtual doorway, leaving echoes of fixed code behind, ready for the challenges ahead.
"""
    
     let secondFianl = """
Upon leaving the main server room, the elite coding team follows the holographic map to a mysterious locked room. The entrance is adorned with a holographic puzzle, glowing with binary and hexadecimal code. The holographic message materializes:

"A ciphered challenge guards the door to the next phase of your journey. Decrypt the code within, and the secrets you seek shall be revealed."

As the team examines the holographic puzzle, they notice a series of binary and hexadecimal digits arranged in a grid, forming an intricate pattern. A riddle appears alongside the puzzle:
"""
    
    
    
    @State var buttonText = "Next"
    
    var body: some View {
        if  self.navigateToNextView{
            Task3()
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
                                                    Upon leaving the main server room, the elite coding team follows the holographic map to a mysterious locked room. The entrance is adorned with a holographic puzzle, glowing with binary and hexadecimal code. The holographic message materializes:
                                                    "A ciphered challenge guards the door to the next phase of your journey. Decrypt the code within, and the secrets you seek shall be revealed."
                                                    As the team examines the holographic puzzle, they notice a series of binary and hexadecimal digits arranged in a grid, forming an intricate pattern. A riddle appears alongside the puzzle:
                                                    """

                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                        self.animateTitle = ""
                                                        self.indexValue = 0
                                                        self.startAnimation()
                                                    }
                                                    buttonText = "Solve"
                                              
                                                    // Add your custom action here
                                                    
                                                
                                                    
                                                    
                                                case 2:
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
                    Image("ones")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .offset(y:225)
                        .allowsHitTesting(false)
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
                UserDefaults.standard.set("scenario2", forKey: "leftOff")
                    }
        }

            
        }
    }

#Preview {
    scenario2()
}
