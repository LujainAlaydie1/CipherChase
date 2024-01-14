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
   Undeterred by The Encoder's challenge, the elite coding team engages in the Binary Battle. Deciphering the complex seven-letter code, they unveil the key to The Phoenix's true nature.
   
Success opens a virtual doorway to the final confrontation in the heart of the virtual realm. Delving into The Encoder's master code, they unveil the identity and save the academy.
    The holographic map updates one last time, displaying a message of triumph:
  
 "Codebreakers, you have restored balance to the digital realm. The academy is secure, and your coding legacy lives on."
   
The virtual realm transforms, achieving newfound stability. The holographic map displays a triumphant message, and the elite team stands in the serene environment, marking the end of their epic journey to safeguard the coding academy.
"""
    
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    ("Codebreakers, you have restored balance to the digital realm. The academy is secure, and your coding legacy lives on.")
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
    
   
    
    @State var buttonText = "End"
    @EnvironmentObject var router: Router

    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        GeometryReader { geometry in
                            styledText(for: animateTitle)
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
                                                    router.navigateToRoot()
                                                    
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
