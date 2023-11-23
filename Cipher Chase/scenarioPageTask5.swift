//
//  scenarioPageTask5.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 23/11/2023.
//

import SwiftUI

struct scenarioPageTask5: View {
    @State private var screenSize: CGSize = .zero
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)

            VStack {

                GeometryReader { geometry in
                    Text("Prepare, Decoders, for the Binary Battle awaits. In this realm of zeros and ones, Decode my binary message to reveal a seven-letter word. Your coding prowess is your weapon, let the unraveling begin. Type the decrypted word to unlock the secrets within The Phoenix's domain.")
                        .font(Font.custom("PixelifySans-Bold", size: 16))
                        .position(x: geometry.size.width * 0.36, y: 180)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 20)
                        
                }
                Spacer()

                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
            }
            .onAppear {
                // Capture the original screen size when the view appears
                screenSize = UIScreen.main.bounds.size
                // Subscribe to orientation changes
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    orientation = UIDevice.current.orientation
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                // Handle orientation changes here
                if orientation.isPortrait || orientation.isLandscape  || orientation.isFlat {
                    // Maintain the original size on rotation
                    screenSize = UIScreen.main.bounds.size
                }
            }
            .frame(width: screenSize.width, height: screenSize.height) // Maintain the size
            .contentShape(Rectangle())
        }
    }
}


#Preview {
    scenarioPageTask5()
}
