//
//  startPage.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 26/11/2023.
//

import SwiftUI

struct startPage: View {
    
    //@State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String = """
    In the dark corners of the digital world, an enigmatic figure known as The Encoder has infiltrated a renowned coding academy, leaving a trail of corrupted programs and vanished data.
    
The academy, seeking the help of the most skilled coders, assembles a team of elite programmers to unravel the mystery behind The Encoder's malicious activities.
"""
    
    
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    
    @EnvironmentObject var router: Router

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
    
    @State private var showText = false
    @State private var showButton = false
    
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: "The Encoder ")
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
    
    func startPopUpAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
            self.showText.toggle()
        }
    }
    
    @State private var navigateToNextView = false
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
            ZStack{
                Color(.background)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    GeometryReader { geometry in
                        
                        styledText(for: animateTitle)
                            .padding(.horizontal)
                            .padding(.top, geometry.safeAreaInsets.top) // Adjust for top safe area
                            .padding([.leading, .trailing]) // Adjust padding as needed
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .offset(y: -60)

                        
                        
                    } // Geometry reader
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        
                        if showText {
                            
                            
                            Text("Are \nYou \nReady \nTo Start?")
                                .padding()
                                .font(Font.custom("PixelifySans-Bold", size: 30))
                                .foregroundColor(.logocolor)
                                .padding(.horizontal)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .transition(.opacity) // Apply a transition effect
                                .onAppear{
                                    startPopUpAnimation() // Start the pop-up animation
                                }
                            
                        }//if
                        
                        HStack{
                            Button("     Start    "){
                                router.navigate(to: .scenariopagesh)
                            }
                            .buttonStyle(BlueButton())
                        }
                        
                    }//Vstack
                    
                    
                    Spacer()
                    Image("ones")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .zIndex(-1)
                    
                } // VStack
                .onAppear {
                    startAnimation() // Start the initial animation
                    //startPopUpAnimation() // Start the pop-up animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Change the delay as needed
                        showText = true
                    }
                }
            }//ZStack
            
            .onAppear {
                UserDefaults.standard.set("StartPage", forKey: "leftOff")
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
    startPage()
}
