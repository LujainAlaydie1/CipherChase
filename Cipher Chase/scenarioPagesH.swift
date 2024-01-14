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
Elite Coding Team enters a virtual coding academy lobby, finds a laptop with a mysterious message from The Encoder. The laptop is pin-protected with a countdown timer, prompting a race to unlock its secrets. The room is filled with holographic code displays and neon lights, and a riddle on the floor.

"Cracked minds seek truth, but only those with the code can reveal it. Your journey begins here, Unlock the secrets within"
"""
    
    
    @State var buttonText = "Solve"
    
    @EnvironmentObject var router: Router

    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    (Elite Coding Team)|("Cracked minds seek truth, but only those with the code can reveal it. Your journey begins here, Unlock the secrets within")|(The Encoder)
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
                                .offset(y: -60)
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
                                                    router.navigate(to: .progress0)
                                                    
                                                    
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
                
                
                .contentShape(Rectangle())
            }
            .onReceive([self.clickCount].publisher) { _ in
                // Code to execute when clickCount changes
                // You can print values or trigger animations here
                print("Click count: \(clickCount)")
            }
            .onAppear {
                UserDefaults.standard.set("scenarioPagesH", forKey: "leftOff")

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
}

#Preview {
    scenarioPagesH()
}
