//
//  SplashScreen.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 22/11/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var screenSize: CGSize = .zero
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    var body: some View {
        ZStack {
            Color(.sRGB, red: 2/255, green: 49/255, blue: 69/255)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)

                Spacer()

                GeometryReader { geometry in
                    logo()
                        .fill(Color(.logocolor))
                        .frame(width: 100, height: 100)
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2) - 50)
                    

                    Text("Cipher Chase")
                        .font(Font.custom("PixelifySans-Bold", size: 32))
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2) + 30)
                        .shadow(color: Color.black, radius: 4, x: 4, y: 3)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.accents, .secondarys],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
                Spacer()

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
    SplashScreen()
}

