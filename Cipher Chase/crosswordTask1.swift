//
//  crosswordTask1.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 27/11/2023.
//

import SwiftUI

struct crosswordTask1: View {
    
    @State var one: String = "1"
    @State var zero: String = "0"

    @State var animateTitle: String = ""
    @State var finalText: String = "In the realm of binary enigmas, the key lies in simplicity. Decode the binary sequence and distill it down to two digits. Unravel the essence of the code, and you'll find the gateway to the heart of logic."
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    
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
    
    // Check Correctness & everything else
    
    @State var someText = ""
    @State private var enteredLetters: [String] = ["",""]
    @State var isActive: Bool = false

    
    func checkCorrectness() -> Bool {
        let correctLetters = ["5", "9"]
        var allCorrect = true
        
        for (index, enteredLetter) in enteredLetters.enumerated() {
            guard index < correctLetters.count else {
                break
            }
            
            let correctLetter = correctLetters[index]
            
            if enteredLetter.lowercased() == correctLetter.lowercased() {
                print("Correct letter at index \(index)!")
            } else {
                print("Incorrect letter at index \(index)!")
                allCorrect = false
            }
        }
        
        if allCorrect {
            print("All letters are correct!")
            isActive = true
            return true
        } else {
            print("Some letters are incorrect.")
            return false
        }
    }
    
    func checkAllFilled() {
        let isFilled = !enteredLetters.contains { $0.isEmpty }
        
        if isFilled {
            print("All text fields are filled!")
            checkCorrectness()
        } else {
            print("Some text fields are empty.")
        }
    }
    
    var body: some View {
        
        if self.isActive{
            MainPage()
            //Diala's Page
                .transition(.move(edge: .bottom))

            
        }else{
            
        ZStack{
            
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: -20){
                
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
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(white: 1, opacity: 0.14))
                        .padding([.leading, .trailing], -3)
                    //.padding(.top, 100)
                        .frame(width: 350 , height: 400) //height 400 fixes the text, og is 500
                    
                    VStack{
                        VStack{
                            
                            HStack{
                                crosswordBlock(text: $one)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                crosswordBlock(text: $zero)
                                crosswordBlock(text: $one)
                                crosswordBlock(text: $zero)
                                crosswordBlock(text: $one)
                                Text("=")
                                    .font(Font.custom("AnonymousPro-Bold", size: 35))
                                    .fontWeight(.bold)
                                    .foregroundColor(.logocolor)
                                frameStructH(someText: $enteredLetters[0], correctNumbers: "5")
                            }
                            
                            HStack{
                                crosswordBlock(text: $zero)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                crosswordBlock(text: $one)
                                    .padding(.trailing, 30)
                            }
                            
                            HStack{
                                Text("=")
                                    .padding(.trailing, 30)
                                    .font(Font.custom("AnonymousPro-Bold", size: 35))
                                    .fontWeight(.bold)
                                    .foregroundColor(.logocolor)
                            }
                            
                            HStack{
                                frameStructH(someText: $enteredLetters[1], correctNumbers: "9")
                                    .padding(.trailing, 30)
                            }
                            //.padding(.bottom, 100)
                        }//VStack
                        .onReceive(enteredLetters.publisher, perform: { _ in checkAllFilled()})
                        //.padding(.bottom, -100)
                        
                    }//VStack
                }//ZStack
                
                Spacer()
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .zIndex(-1)
                
            }//VStack
            
            
            //.padding(.horizontal) // Add horizontal padding for spacing on the sides
            .padding(.top, 20) // Add bottom padding to the HStack
            
        } // ZStack
    }
    }
}

struct crosswordBlock: View{
    
    @Binding var text: String
    
    var body: some View{
        Text(text)
            .font(Font.custom("AnonymousPro-Bold", size: 35)) //"AnonymousPro-Bold" or "PixelifySans-Bold"
            .fontWeight(.bold)
            .padding()
            .foregroundColor(.black)
            .frame(width: 50, height: 50)
            .background(Color.white)
            .cornerRadius(7)
    }
}

#Preview {
    crosswordTask1()
}

struct frameStructH: View {
    @Binding var someText: String
    var correctNumbers: String

    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                    TextField("   ", text: $someText)
                        .foregroundColor(.black)
                        .font(Font.custom("AnonymousPro-Bold", size: 35))
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        .onChange(of: someText) {
                            if $0.count > 1 {
                                self.someText = String($0.prefix(1))
                            }
                        }
                )
        }
    }
}
