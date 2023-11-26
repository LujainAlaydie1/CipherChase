//
//  task4.swift
//  Cipher Chase
//
//  Created by maha on 09/05/1445 AH.
//

import SwiftUI

struct taskmaha: View {
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
           
                
                Text("Unlock the mystery within shifting shadows. Find the hidden path by decoding the correct shift. Experiment and let the decrypted shift guide your way forward.")
                
                
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
    taskmaha()
}




