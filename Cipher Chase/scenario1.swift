//
//  scenario1.swift
//  Cipher Chase
//
//  Created by Diala Masoud on 27/11/2023.
//

import SwiftUI

struct scenario1: View {
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    @State private var clickCount = 0

    @State private var navigateToNextView = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
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
    The riddle alludes to the binary language, and keen-eyed players discern a binary sequence on the holographic note. Converting these binaries into ASCII, they uncover the word "59" the password.

    With seconds ticking away, they swiftly input "59" into the laptop. As the timer hits zero, the screen flickers, emitting a satisfying hum. The encrypted message transforms:
   
 "Well done, decoders. The journey has just begun. Seek the heart of logic, where bugs await their demise."

    With the laptop unlocked, the elite coding team ventures forth to unravel the mysteries within the academy's virtual realm.
"""
    
     let secondFianl = """
As the Elite Coding Team unlocks the academy's entrance laptop, a holographic map reveals the next destination: the main server room. Neon code cascades as they enter, greeted by an unsettling hum of malfunctioning servers.
"The heart of the academy holds secrets and chaos. Debug the code to reveal the path. Your coding prowess is needed to restore order."
Approaching the central server, lines of buggy code await. A holographic script indicates that debugging is the key to uncover the next clue.
"""
    
    
    
    @State var buttonText = "Next"
    
    @EnvironmentObject var router: Router

    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    ("Well done, decoders. The journey has just begun. Seek the heart of logic, where bugs await their demise.")|(Elite Coding Team)
                                                    """)
        let matches = pattern.matches(in: text, range: NSRange(text.startIndex..., in: text))

        var styledText = Text("")
        var currentIndex = text.startIndex

        for match in matches {
            let range = Range(match.range, in: text)!
            let beforeText = Text(text[currentIndex..<range.lowerBound])
                .font(Font.system(size: 16))
                .foregroundColor(.white)

            let matchText = Text(text[range])
                .font(Font.system(size: 16))
                .foregroundColor(.accents)

            styledText = styledText + beforeText + matchText

            currentIndex = range.upperBound
        }

        let remainingText = Text(text[currentIndex...])
            .font(Font.system(size: 16))
            .foregroundColor(.white)

        return styledText + remainingText
    }

    
    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
 
                    VStack {
                        GeometryReader { geometry in
                            styledText(for: animateTitle)
                                .padding(.horizontal)
                                .padding(.top, geometry.safeAreaInsets.top) // Adjust for top safe area
                                .kerning(1.6)
                                .padding([.leading, .trailing]) // Adjust padding as needed
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .offset(y: -80)
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
                                                    As the Elite Coding Team unlocks the academy's entrance laptop, a holographic map reveals the next destination: the main server room. Neon code cascades as they enter, greeted by an unsettling hum of malfunctioning servers.
                                                    
                                                    "The heart of the academy holds secrets and chaos. Debug the code to reveal the path. Your coding prowess is needed to restore order."
                                                    
                                                    Approaching the central server, lines of buggy code await. A holographic script indicates that debugging is the key to uncover the next clue.
                                                    """

                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                        self.animateTitle = ""
                                                        self.indexValue = 0
                                                        self.startAnimation()
                                                    }
                                                    buttonText = "Solve"
                                              
                                                    
                                                case 2:
                                                    router.navigate(to: .task2)
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
            
            .onReceive([self.clickCount].publisher) { _ in
                // Code to execute when clickCount changes
                // You can print values or trigger animations here
                print("Click count: \(clickCount)")
            }
            .onAppear {
                UserDefaults.standard.set("scenario1", forKey: "leftOff")
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
    scenario1()
}
