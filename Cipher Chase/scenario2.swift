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
The elite coders fix buggy code, unveiling a virtual doorway that marks progress. The map congratulates their debugging skills and introduces the "Logic Labyrinth." The team enters, leaving the server room behind. Following the map, they find a locked room with a holographic puzzle, challenging them to decrypt the code for the next phase. The holographic message materializes:

"A ciphered challenge guards the door to the next phase of your journey. Decrypt the code within, and the secrets you seek shall be revealed."

The intricate pattern, a mix of binary and hexadecimal digits, awaits their deciphering skills along with a accompanying riddle.
"""
    
    
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    ("A ciphered challenge guards the door to the next phase of your journey. Decrypt the code within, and the secrets you seek shall be revealed.")|(The elite coders)
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
    

    
    @State var buttonText = "Next"
    @EnvironmentObject var router: Router

    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack {
                        GeometryReader { geometry in
                            styledText(for: animateTitle)
                                .padding(.horizontal)
                                .font(Font.system(size: 16))
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
                                                    router.navigate(to: .tassk3)

                                                    
                                                default:
                                                    // Default action for subsequent clicks
                                                    print("Clicked again!")
                                                    // Add your default action here
                                                }
                                            }) {
                                                Text(buttonText)
                                                    .font(Font.custom("PixelifySans-Bold.ttf", size: 22))
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
                UserDefaults.standard.set("scenario2", forKey: "leftOff")
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
    scenario2()
}
