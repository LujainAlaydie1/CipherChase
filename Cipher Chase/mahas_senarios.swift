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
Upon successfully decrypting the file, the team unveils a message that provides insight into The Encoder's plans for the academy:
"The Phoenix project aims to infiltrate the core logic of the academy's security system. The Encoder plans to exploit vulnerabilities and gain control. Beware, decoders, the next level awaits, and the Phoenix is ready to spread its wings."
The virtual room echoes with the team's successful decryption, urging them to prepare for the imminent threat posed by The Encoder's Phoenix project. The holographic map updates, directing the team to the next level, where they will face even greater challenges in their mission to safeguard the academy's digital realm.
"""
    

    
    @State var buttonText = "Next"

    var body: some View {
        if  self.navigateToNextView{
            scenarioPageTask5()
            // Lujains Page --> scenarioPageTask5()
        }else{
            NavigationStack(path: $path) {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        GeometryReader { geometry in
                            Text(animateTitle)
                                .font(Font.custom("PixelifySans-Bold", size: 20))
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
                                                    self.finalText = ""
                                                    self.finalText = """
                                                    As the elite coding team emerges from the secret room, their success in decrypting the "Project_Phoenix" file reverberates through the virtual environment. The holographic map guides them to the control room, where an ominous atmosphere awaits. The room is adorned with glowing terminals and a towering holographic display. As the team approaches, The Encoder's sinister laughter echoes through the digital corridors, and a holographic projection materializes before them. "Impressive, Decoders. But can you withstand the Binary Battle? Here, in the realm of zeros and ones, your coding prowess will be put to the ultimate test. Decode my binary sequences if you dare, and perhaps you shall glimpse the true nature of The Phoenix."
                                                    """

                                                    
                                                    
                                                    
                                                    
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                        self.animateTitle = ""
                                                        self.indexValue = 0
                                                        self.startAnimation()
                                                    }
                                              
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
                UserDefaults.standard.set("mahas_senarios", forKey: "leftOff")
                    }
            
        }
        
           
        }
}


#Preview {
    mahas_senarios()
}




