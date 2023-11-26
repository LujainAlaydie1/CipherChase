//
//  task4.swift
//  Cipher Chase
//
//  Created by maha on 09/05/1445 AH.
//

import SwiftUI

struct task4: View {
    @State private var screenSize: CGSize = .zero
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    var body: some View {
        
        ZStack {
            
            Color(.sRGB, red: 2/255, green: 49/255, blue: 69/255)
                .edgesIgnoringSafeArea(.all)

            VStack {
                
                Spacer()
               
                Spacer()
                
                
                
                
                GeometryReader { geometry in
               
                    
                    Text("""
                            Upon successfully decrypting the file, the team unveils a message that provides insight into The Encoder's plans for the academy:
                            "The Phoenix project aims to infiltrate the core logic of the academy's security system. The Encoder plans to exploit vulnerabilities and gain control. Beware, decoders, the next level awaits, and the Phoenix is ready to spread its wings." The virtual room echoes with the team's successful decryption, urging them to prepare for the imminent threat posed by The Encoder's Phoenix project. The holographic map updates, directing the team to the next level, where they will face even greater challenges in their mission to safeguard the academy's digital realm.
"""
                )
                    
                    
                        .font(Font.custom("PixelifySans-Bold", size: 16))
                        .position(x: geometry.size.width * 0.36, y: 180)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 20)
                    
                    
                }
                
         
                
         
                Button(action: {
                    // Action to perform when the button is tapped
                    print("Button tapped!")
                }) {
                    Text("start")
                        .font(.headline)
                        .foregroundColor(.secondarys)
                        .frame(width: 176, height: 50)
                        .background(Color("logocolor"))
                        .cornerRadius(10)
                    
                }
                
                
                
                
                
                
                
                
                
                
          

                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
            }
            .contentShape(Rectangle())
        }
    }
}


#Preview {
    task4()
}




