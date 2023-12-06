//
//  scenarioPageTask5.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 23/11/2023.
//

import SwiftUI
import Combine

struct scenarioPageTask5: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()
    @State var isActive: Bool = false

    
    @State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String = "Prepare, Decoders, for the Binary Battle awaits.In this realm  of zeros and ones, Decode my binary message to reveal a seven-letter word. Your coding prowess is your weapon, let the unraveling begin. Type the decrypted word to unlock the secrets within the domain."
    
    
    @State private var enteredLetters: [String] = ["","","","","","",""]
    
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.1
    private var cancellables: Set<AnyCancellable> = []
    
    
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
    
    func checkCorrectness()  -> Bool{
        // Assuming correctLetters is an array of correct letters in the same order
        let correctLetters = ["P", "h", "o", "e","n","i","x"]
        var allCorrect = true
        for (index, enteredLetter) in enteredLetters.enumerated() {
            guard index < correctLetters.count else {
                break
            }
            
            let correctLetter = correctLetters[index]
            
            if enteredLetter.lowercased() == correctLetter.lowercased() {
                // Handle correct letter at index
                print("Correct letter at index \(index)!")
                
            }  else {
                // Handle incorrect letter at index
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
            winTask5()
                .transition(.move(edge: .bottom))

            
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
                            
                        }
                        GeometryReader { geometry in
                            ZStack{
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(white: 1, opacity: 0.14))
                                        .padding([.leading, .trailing]) // Adjust padding as needed
                                        .frame(width: geometry.size.width, height: geometry.size.height + 40)
                                    
                                    
                                    VStack{
                                        HStack{
                                            frameStruct(someText: $enteredLetters[0], binary: "01010000", correctLetter: "P")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[1], binary: "01101000", correctLetter: "h")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[2], binary: "01101111", correctLetter: "o")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[3], binary: "01100101", correctLetter: "e")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[4], binary: "01101110", correctLetter: "n")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[5], binary: "01101001", correctLetter: "i")
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[6], binary: "01111000", correctLetter: "x")
                                        }
                                        .padding(.bottom)
                                        
                                        
                                    }.onReceive(enteredLetters.publisher, perform: { _ in
                                        checkAllFilled()
                                    })
                                    
                                }
                                .offset(y: -(geometry.size.height / 2.3))  // Adjust the value based on how much you want to lift it up
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
                .navigationBarHidden(true)  // Hide the navigation bar on this screen
                
                // Navigate to a different page when all correct letters are entered
//                NavigationLink(
//                    destination: winTask5(),  // Replace YourDestinationView with the view you want to navigate to
//                    isActive: Binding(
//                        get: { enteredLetters.allSatisfy { !$0.isEmpty } && checkCorrectness() == true },
//                        set: { _ in }
//                    )
//                ) {
//                    EmptyView()
//                }
                
                
            }
            .onAppear {
                UserDefaults.standard.set("scenarioPageTask5", forKey: "leftOff")
                    }
            
        }

    }
      }



#Preview {
    scenarioPageTask5()
}



extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
