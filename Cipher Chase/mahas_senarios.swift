//
//  mahas_senarios.swift
//  Cipher Chase
//
//  Created by maha on 09/05/1445 AH.
//
//
import SwiftUI

struct mahas_senarios: View {
    
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
Successfully decoding the file reveals The Encoder's plan for the academy:

"The Phoenix project aims to infiltrate the core logic of the academy's security system, exploiting vulnerabilities to gain control. Beware, decoders, as the next level awaits, and the Phoenix is ready to spread its wings."

The holographic map updates, guiding the team to face greater challenges. Exiting the secret room, their success reverberates, leading them to the ominous control room. The Encoder challenges them with a Binary Battle, testing their coding prowess in the realm of zeros and ones to glimpse the true nature of The Phoenix.

"Decipher this seven-letter code, Decoders. In its essence lies the key to The Phoenix's true nature."
"""
    
    
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    ("The Phoenix project aims to infiltrate the core logic of the academy's security system, exploiting vulnerabilities to gain control. Beware, decoders, as the next level awaits, and the Phoenix is ready to spread its wings.")|("Decipher this seven-letter code, Decoders. In its essence lies the key to The Phoenix's true nature.")
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
            
            
            
            
            Image("ones")
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .offset(y:250)
                .allowsHitTesting(false)  // Disable user interaction
            
            
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
                                            router.navigate(to: .scenario5)

        
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
            
        }
        
        
        .contentShape(Rectangle())
        
        .onReceive([self.clickCount].publisher) { _ in
            // Code to execute when clickCount changes
            // You can print values or trigger animations here
            print("Click count: \(clickCount)")
        }
        
        .onAppear {
            UserDefaults.standard.set("mahas_senarios", forKey: "leftOff")
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
    mahas_senarios()
}




