//
//  MainPage.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 23/11/2023.
//

import SwiftUI

struct MainPage: View {
    
    @State private var path = NavigationPath()
    @State private var navigateToNextView = false

    var body: some View {
        
        if  self.navigateToNextView{
            scenarioPagesH()
            
        }else{
            
            NavigationStack(path: $path) {
                ZStack{
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0){ // Title
                        
                        Spacer()
                        
                        Text("Cipher")
                            .font(Font.custom("PixelifySans-Bold", size: 64))
                            .shadow(color: Color.black, radius: 4, x: 4, y: 3)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.accents, .secondarys],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Text("Chase")
                            .font(Font.custom("PixelifySans-Bold", size: 64))
                            .shadow(color: Color.black, radius: 4, x: 4, y: 3)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.accents, .secondarys],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Capsule()
                            .fill(Color.logocolor)
                            .frame(width: 180 ,height: 24)
                            .overlay(
                                Text("Crack the Case")
                                    .font(Font.custom("PixelifySans-Bold", size: 16))
                                    .foregroundStyle(.secondarys)
                            )
                        
                        Spacer()
                        
                        VStack(spacing: 20){
                            
                            Button("New Game"){
                                navigateToNextView = true
                            }
                            .buttonStyle(BlueButton())
                            
                            
                            Button(" Continue  "){
                                
                            }
                            .buttonStyle(BlueButton())
                            
                            Button("     About     "){
                                
                            }
                            .buttonStyle(BlueButton())
                            
                        }
                        
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                    }
                }
            }
        }
    }
}

 struct BlueButton: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.logocolor)
            .frame(width: 190, height: 50)
            .foregroundStyle(.secondarys)
            .font(Font.custom("PixelifySans-Bold", size: 32))
            .cornerRadius(15)
            .shadow(color: Color.secondarys, radius: 0, x: 5, y: 7)
    }
}

#Preview {
    MainPage()
}
