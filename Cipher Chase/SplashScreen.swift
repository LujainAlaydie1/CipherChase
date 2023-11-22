//
//  ContentView.swift
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
                        .fill(Color(.sRGB, red: 56/255, green: 208/255, blue: 178/255))
                        .frame(width: 100, height: 100)
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2) - 50)
                    Text("Cipher Chase")
                        .foregroundColor(Color.white)
                        .font(Font.custom("PixelifySans-Bold", size: 32))
                        .alignmentGuide(HorizontalAlignment.center) { _ in 50 }
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2) + 30)
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
    SplashScreen()
}

struct LogoView: View {
    var body: some View {
        logo()
            .fill(Color(.sRGB, red: 56/255, green: 208/255, blue: 178/255))
            .frame(width: 100, height: 100)  // Adjust size as needed
    }
}

struct logo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.2881*width, y: height))
        path.addCurve(to: CGPoint(x: 0.26702*width, y: 0.98909*height), control1: CGPoint(x: 0.28047*width, y: height), control2: CGPoint(x: 0.27283*width, y: 0.99635*height))
        path.addLine(to: CGPoint(x: 0.02894*width, y: 0.69187*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.6047*height), control1: CGPoint(x: 0.01028*width, y: 0.66858*height), control2: CGPoint(x: 0, y: 0.63763*height))
        path.addCurve(to: CGPoint(x: 0.02894*width, y: 0.51752*height), control1: CGPoint(x: 0, y: 0.57177*height), control2: CGPoint(x: 0.01028*width, y: 0.54082*height))
        path.addLine(to: CGPoint(x: 0.04298*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.02894*width, y: 0.48248*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.3953*height), control1: CGPoint(x: 0.01028*width, y: 0.45918*height), control2: CGPoint(x: 0, y: 0.42823*height))
        path.addCurve(to: CGPoint(x: 0.02894*width, y: 0.30813*height), control1: CGPoint(x: 0, y: 0.36238*height), control2: CGPoint(x: 0.01028*width, y: 0.33143*height))
        path.addLine(to: CGPoint(x: 0.26702*width, y: 0.01091*height))
        path.addCurve(to: CGPoint(x: 0.29953*width, y: 0.00286*height), control1: CGPoint(x: 0.27552*width, y: 0.00025*height), control2: CGPoint(x: 0.28837*width, y: -0.00291*height))
        path.addCurve(to: CGPoint(x: 0.31791*width, y: 0.03727*height), control1: CGPoint(x: 0.31068*width, y: 0.00864*height), control2: CGPoint(x: 0.31791*width, y: 0.02221*height))
        path.addLine(to: CGPoint(x: 0.31791*width, y: 0.24667*height))
        path.addCurve(to: CGPoint(x: 0.30917*width, y: 0.27298*height), control1: CGPoint(x: 0.31791*width, y: 0.25654*height), control2: CGPoint(x: 0.31475*width, y: 0.26602*height))
        path.addLine(to: CGPoint(x: 0.12732*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.22744*width, y: 0.62504*height))
        path.addCurve(to: CGPoint(x: 0.27944*width, y: 0.64809*height), control1: CGPoint(x: 0.24116*width, y: 0.64217*height), control2: CGPoint(x: 0.26018*width, y: 0.65061*height))
        path.addCurve(to: CGPoint(x: 0.32657*width, y: 0.6123*height), control1: CGPoint(x: 0.29873*width, y: 0.64562*height), control2: CGPoint(x: 0.31593*width, y: 0.63259*height))
        path.addLine(to: CGPoint(x: 0.56303*width, y: 0.1626*height))
        path.addCurve(to: CGPoint(x: 0.60431*width, y: 0.15194*height), control1: CGPoint(x: 0.57204*width, y: 0.14542*height), control2: CGPoint(x: 0.59055*width, y: 0.14064*height))
        path.addCurve(to: CGPoint(x: 0.61285*width, y: 0.20348*height), control1: CGPoint(x: 0.61807*width, y: 0.16324*height), control2: CGPoint(x: 0.62191*width, y: 0.1863*height))
        path.addLine(to: CGPoint(x: 0.37639*width, y: 0.65317*height))
        path.addCurve(to: CGPoint(x: 0.28549*width, y: 0.72214*height), control1: CGPoint(x: 0.35587*width, y: 0.69222*height), control2: CGPoint(x: 0.32274*width, y: 0.7174*height))
        path.addCurve(to: CGPoint(x: 0.18525*width, y: 0.67766*height), control1: CGPoint(x: 0.24828*width, y: 0.72687*height), control2: CGPoint(x: 0.2117*width, y: 0.71068*height))
        path.addLine(to: CGPoint(x: 0.08513*width, y: 0.55262*height))
        path.addLine(to: CGPoint(x: 0.0711*width, y: 0.57015*height))
        path.addCurve(to: CGPoint(x: 0.05963*width, y: 0.60465*height), control1: CGPoint(x: 0.0637*width, y: 0.57938*height), control2: CGPoint(x: 0.05963*width, y: 0.59162*height))
        path.addCurve(to: CGPoint(x: 0.0711*width, y: 0.63915*height), control1: CGPoint(x: 0.05963*width, y: 0.61768*height), control2: CGPoint(x: 0.0637*width, y: 0.62997*height))
        path.addLine(to: CGPoint(x: 0.30917*width, y: 0.93637*height))
        path.addCurve(to: CGPoint(x: 0.30917*width, y: 0.98899*height), control1: CGPoint(x: 0.32084*width, y: 0.95088*height), control2: CGPoint(x: 0.32084*width, y: 0.97448*height))
        path.addCurve(to: CGPoint(x: 0.2881*width, y: 0.9999*height), control1: CGPoint(x: 0.30336*width, y: 0.99625*height), control2: CGPoint(x: 0.29573*width, y: 0.9999*height))
        path.addLine(to: CGPoint(x: 0.2881*width, y: height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.25828*width, y: 0.12711*height))
        path.addLine(to: CGPoint(x: 0.0711*width, y: 0.3608*height))
        path.addCurve(to: CGPoint(x: 0.05963*width, y: 0.3953*height), control1: CGPoint(x: 0.0637*width, y: 0.37003*height), control2: CGPoint(x: 0.05963*width, y: 0.38227*height))
        path.addCurve(to: CGPoint(x: 0.0711*width, y: 0.42981*height), control1: CGPoint(x: 0.05963*width, y: 0.40833*height), control2: CGPoint(x: 0.0637*width, y: 0.42062*height))
        path.addLine(to: CGPoint(x: 0.08513*width, y: 0.44733*height))
        path.addLine(to: CGPoint(x: 0.25828*width, y: 0.23117*height))
        path.addLine(to: CGPoint(x: 0.25828*width, y: 0.12701*height))
        path.addLine(to: CGPoint(x: 0.25828*width, y: 0.12711*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.08513*width, y: 0.55262*height))
        path.addLine(to: CGPoint(x: 0.04294*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.0289*width, y: 0.51752*height))
        path.addCurve(to: CGPoint(x: 0.01407*width, y: 0.54142*height), control1: CGPoint(x: 0.02309*width, y: 0.52478*height), control2: CGPoint(x: 0.01819*width, y: 0.53288*height))
        path.addLine(to: CGPoint(x: 0.08513*width, y: 0.55262*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.12732*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.14306*width, y: 0.48035*height))
        path.addLine(to: CGPoint(x: 0.08513*width, y: 0.44738*height))
        path.addLine(to: CGPoint(x: 0.12732*width, y: 0.5*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.7119*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.73298*width, y: 0.01091*height), control1: CGPoint(x: 0.71953*width, y: 0), control2: CGPoint(x: 0.72717*width, y: 0.00365*height))
        path.addLine(to: CGPoint(x: 0.97106*width, y: 0.30813*height))
        path.addCurve(to: CGPoint(x: width, y: 0.3953*height), control1: CGPoint(x: 0.98972*width, y: 0.33143*height), control2: CGPoint(x: width, y: 0.36237*height))
        path.addCurve(to: CGPoint(x: 0.97106*width, y: 0.48248*height), control1: CGPoint(x: width, y: 0.42823*height), control2: CGPoint(x: 0.98972*width, y: 0.45918*height))
        path.addLine(to: CGPoint(x: 0.95702*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.97106*width, y: 0.51752*height))
        path.addCurve(to: CGPoint(x: width, y: 0.6047*height), control1: CGPoint(x: 0.98972*width, y: 0.54082*height), control2: CGPoint(x: width, y: 0.57177*height))
        path.addCurve(to: CGPoint(x: 0.97106*width, y: 0.69187*height), control1: CGPoint(x: width, y: 0.63763*height), control2: CGPoint(x: 0.98972*width, y: 0.66857*height))
        path.addLine(to: CGPoint(x: 0.73298*width, y: 0.98909*height))
        path.addCurve(to: CGPoint(x: 0.70048*width, y: 0.99714*height), control1: CGPoint(x: 0.72448*width, y: 0.99975*height), control2: CGPoint(x: 0.71163*width, y: 1.00291*height))
        path.addCurve(to: CGPoint(x: 0.68209*width, y: 0.96273*height), control1: CGPoint(x: 0.68933*width, y: 0.99136*height), control2: CGPoint(x: 0.68209*width, y: 0.97779*height))
        path.addLine(to: CGPoint(x: 0.68209*width, y: 0.75333*height))
        path.addCurve(to: CGPoint(x: 0.69083*width, y: 0.72702*height), control1: CGPoint(x: 0.68209*width, y: 0.74346*height), control2: CGPoint(x: 0.68525*width, y: 0.73398*height))
        path.addLine(to: CGPoint(x: 0.87268*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.77256*width, y: 0.37496*height))
        path.addCurve(to: CGPoint(x: 0.72056*width, y: 0.35191*height), control1: CGPoint(x: 0.75884*width, y: 0.35783*height), control2: CGPoint(x: 0.73982*width, y: 0.34939*height))
        path.addCurve(to: CGPoint(x: 0.67343*width, y: 0.3877*height), control1: CGPoint(x: 0.70127*width, y: 0.35438*height), control2: CGPoint(x: 0.68407*width, y: 0.36741*height))
        path.addLine(to: CGPoint(x: 0.43697*width, y: 0.8374*height))
        path.addCurve(to: CGPoint(x: 0.39569*width, y: 0.84806*height), control1: CGPoint(x: 0.42792*width, y: 0.85458*height), control2: CGPoint(x: 0.40945*width, y: 0.85936*height))
        path.addCurve(to: CGPoint(x: 0.38715*width, y: 0.79653*height), control1: CGPoint(x: 0.38193*width, y: 0.83676*height), control2: CGPoint(x: 0.3781*width, y: 0.8137*height))
        path.addLine(to: CGPoint(x: 0.62361*width, y: 0.34683*height))
        path.addCurve(to: CGPoint(x: 0.71451*width, y: 0.27786*height), control1: CGPoint(x: 0.64413*width, y: 0.30778*height), control2: CGPoint(x: 0.67727*width, y: 0.2826*height))
        path.addCurve(to: CGPoint(x: 0.81475*width, y: 0.32234*height), control1: CGPoint(x: 0.75172*width, y: 0.27313*height), control2: CGPoint(x: 0.7883*width, y: 0.28932*height))
        path.addLine(to: CGPoint(x: 0.91487*width, y: 0.44738*height))
        path.addLine(to: CGPoint(x: 0.92891*width, y: 0.42985*height))
        path.addCurve(to: CGPoint(x: 0.94037*width, y: 0.39535*height), control1: CGPoint(x: 0.9363*width, y: 0.42062*height), control2: CGPoint(x: 0.94037*width, y: 0.40838*height))
        path.addCurve(to: CGPoint(x: 0.92891*width, y: 0.36085*height), control1: CGPoint(x: 0.94037*width, y: 0.38232*height), control2: CGPoint(x: 0.9363*width, y: 0.37003*height))
        path.addLine(to: CGPoint(x: 0.69083*width, y: 0.06363*height))
        path.addCurve(to: CGPoint(x: 0.69083*width, y: 0.01101*height), control1: CGPoint(x: 0.67916*width, y: 0.04912*height), control2: CGPoint(x: 0.67916*width, y: 0.02552*height))
        path.addCurve(to: CGPoint(x: 0.7119*width, y: 0.0001*height), control1: CGPoint(x: 0.69664*width, y: 0.00375*height), control2: CGPoint(x: 0.70427*width, y: 0.0001*height))
        path.addLine(to: CGPoint(x: 0.7119*width, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.74172*width, y: 0.87289*height))
        path.addLine(to: CGPoint(x: 0.92891*width, y: 0.6392*height))
        path.addCurve(to: CGPoint(x: 0.94037*width, y: 0.6047*height), control1: CGPoint(x: 0.9363*width, y: 0.62997*height), control2: CGPoint(x: 0.94037*width, y: 0.61773*height))
        path.addCurve(to: CGPoint(x: 0.92891*width, y: 0.57019*height), control1: CGPoint(x: 0.94037*width, y: 0.59167*height), control2: CGPoint(x: 0.9363*width, y: 0.57938*height))
        path.addLine(to: CGPoint(x: 0.91487*width, y: 0.55267*height))
        path.addLine(to: CGPoint(x: 0.74172*width, y: 0.76883*height))
        path.addLine(to: CGPoint(x: 0.74172*width, y: 0.87299*height))
        path.addLine(to: CGPoint(x: 0.74172*width, y: 0.87289*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.91487*width, y: 0.44733*height))
        path.addLine(to: CGPoint(x: 0.95706*width, y: 0.49995*height))
        path.addLine(to: CGPoint(x: 0.9711*width, y: 0.48243*height))
        path.addCurve(to: CGPoint(x: 0.98592*width, y: 0.45854*height), control1: CGPoint(x: 0.97691*width, y: 0.47517*height), control2: CGPoint(x: 0.98181*width, y: 0.46707*height))
        path.addLine(to: CGPoint(x: 0.91487*width, y: 0.44733*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.87268*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.85694*width, y: 0.51965*height))
        path.addLine(to: CGPoint(x: 0.91487*width, y: 0.55262*height))
        path.addLine(to: CGPoint(x: 0.87268*width, y: 0.5*height))
        path.closeSubpath()
        return path
    }
}

