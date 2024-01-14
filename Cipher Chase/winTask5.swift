//
//  winTask5.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 25/11/2023.
//

import SwiftUI
import FLAnimatedImage


struct winTask5: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var someText = ""
    @State var finalText: String = "Prepare, Decoders, for the Binary Battle awaits.In this realm  of zeros and ones, Decode my binary message to reveal a seven-letter word. Your coding prowess is your weapon, let the unraveling begin. Type the decrypted word to unlock the secrets within the domain."
    
    @State private var enteredLetters: [String] = ["P","h","o","e","n","i","x"]
    @State public var tropheyPath: String = "trophey"
    @State var isActive: Bool = false
    @EnvironmentObject var router: Router

    var body: some View {
            ZStack {
                Color(.background)
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    GeometryReader { geometry in
                        Image(tropheyPath)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 47, height: 35)
                            .offset(y:geometry.size.height / 36)
                            .padding([.leading] ,geometry.size.width / 2 - 22)
                        
                    }
                }.padding(.bottom)
                
                
                VStack {
                    GeometryReader { geometry in
                        Text(finalText)
                            .font(Font.system(size: 16))
                            .padding(.horizontal)
                            .padding(.top, geometry.safeAreaInsets.top + 20) // Adjust for top safe area
                            .padding([.leading, .trailing]) // Adjust padding as needed
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(white: 1, opacity: 0.15))
                    }
                    ZStack{
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 260, height: 58)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(10)
                                .offset(x: geometry.size.width / 7, y: -(geometry.size.height / 15))  // Adjust the value based on how much you want to lift it up
                                .overlay{
                                    Text("Phoenix")
                                        .font(.custom("PixelifySans-Bold.ttf", size: 36))
                                        .lineLimit(1)
                                        .frame(alignment: .leading)
                                        .multilineTextAlignment(.center)
                                        .offset(x: geometry.size.width / 7, y: (geometry.size.height) / 8 - 50)
                                }
                                .shadow(color: Color.black.opacity(1), radius: 10, x: 2, y: 10)
                            
                            GeometryReader { geometry in
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 191, height: 126)
                                    .background(
                                        GIFView(type: .name("phoenix"))
                                            .frame(width: 191, height: 126)
                                            .offset(x: geometry.size.width / 2 - 10, y: geometry.size.height / 9 - 110)
                                    )
                                    .shadow(color: Color.black.opacity(1), radius: 10, x: 0, y: 5)
                                
                            }
                            
                            sparkle().fill().frame(width: 14, height: 15)
                                .offset(x: geometry.size.width / 9 - 10, y: geometry.size.height / 10 - 50)
                                .foregroundColor(.white)
                            
                            smallSparkle().fill().frame(width: 8, height: 8)
                                .offset(x: geometry.size.width / 23, y: geometry.size.height / 8)
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                    
                    GeometryReader { geometry in
                        
                        ZStack{
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(white: 1, opacity: 0.14))
                                    .padding([.leading, .trailing]) // Adjust padding as needed
                                    .frame(width: geometry.size.width / 2, height: (geometry.size.height * 2) / 3 + 50)
                                    .offset(y: -(geometry.size.height / 12))  // Adjust the value based on how much you want to lift it up
                                
                                
                                VStack(spacing: -60){
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[0], binary: "01010000", correctLetter: "P")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[1], binary: "01101000", correctLetter: "h")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[2], binary: "01101111", correctLetter: "o")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[3], binary: "01100101", correctLetter: "e")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[4], binary: "01101110", correctLetter: "n")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[5], binary: "01101001", correctLetter: "i")
                                    }
                                    HStack{
                                        winframeStruct(someText: $enteredLetters[6], binary: "01111000", correctLetter: "x")
                                    }
                                    .padding(.bottom)
                                    
                                }
                            }
                            
                            .offset(y: -(geometry.size.height / 3.3))  // Adjust the value based on how much you want to lift it up
                            
                        }
                        HStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 8)
                                .padding([.leading, .trailing], geometry.size.width / 3)
                                .foregroundColor(.secondarys)
                                .offset(x: 25, y: 205)
                                        .overlay{
                                            Text("Next")
                                                .font(Font.custom("PixelifySans-Bold.ttf", size: 22))
                                                .foregroundColor(.secondarys)
                                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 8)
                                            
                                                .background(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .foregroundColor(.accents)
                                                    
                                                )
                                                .offset(x: 20, y: 200)
                                                .onTapGesture {
                                                    router.navigate(to: .progress6)
                                                }

                                                                            
                                        }
                            }
                        
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .offset(y:130)
                            .allowsHitTesting(false)  // Disable user interaction
                        

                    }
                }
                .contentShape(Rectangle())
 
            }
            .onAppear {
                    UserDefaults.standard.set("winTask5", forKey: "leftOff")
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
    winTask5()
}


enum URLType {
  case name(String)
  case url(URL)

  var url: URL? {
    switch self {
      case .name(let name):
        return Bundle.main.url(forResource: name, withExtension: "gif")
      case .url(let remoteURL):
        return remoteURL
    }
  }
}
