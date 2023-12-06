//
//  continuePage.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 30/11/2023.
//

import SwiftUI
import Combine

struct task4q: View {
    
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
      Unlock the mystery within shifting shadows. Find the hidden path by decoding the correct shift. Experiment and let the decrypted shift guide your way forward.
"""
    
    @State var buttonText = "Next"
    
    var body: some View {
        if  self.navigateToNextView{
            traceView()
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
            
        }
        
            
        }
    }

#Preview {
    task4q()
}
