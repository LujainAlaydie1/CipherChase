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
    @State var finalText: String = "Prepare, Decoders, for the Binary Battle awaits. In this realm of zeros and ones, Decode my binary message to reveal a seven-letter word. Your coding prowess is your weapon, let the unraveling begin. Type the decrypted word to unlock the secrets within The Phoenix's domain."
    
    
    @State private var enteredLetters: [String] = ["","","","","","",""]
    
    
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
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
            if checkCorrectness(){
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    router.navigate(to: .task5)
                }
            }        } else {
            print("Some text fields are empty.")
        }
    }
    
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false
    @State private var progress: Double =  6.5 / 7
    
    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                        .alert(isPresented: $isShowingPopup) {
                            Alert(
                                title: Text("Information"),
                                message: Text("Decode the binary letters to figure out the word it spells"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    VStack(spacing: -20) {
                        
                        
                      
                        
                        GeometryReader { geometry in
                            Text(animateTitle)
                                .font(Font.system(size: 16))
                                .padding(.horizontal)
                                .padding(.top, geometry.safeAreaInsets.top + 30) // Adjust for top safe area
                                .padding([.leading, .trailing]) // Adjust padding as needed
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .offset(y: -60)
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
                                            frameStruct(someText: $enteredLetters[0], binary: "01010000", correctLetter: "P", correctPosition: 0, enteredLetters: $enteredLetters)
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[1], binary: "01101000", correctLetter: "H", correctPosition: 1, enteredLetters: $enteredLetters)

                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[2], binary: "01101111", correctLetter: "O", correctPosition: 2, enteredLetters: $enteredLetters)

                                            
                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[3], binary: "01100101", correctLetter: "E", correctPosition: 3, enteredLetters: $enteredLetters)

                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[4], binary: "01101110", correctLetter: "N", correctPosition: 4, enteredLetters: $enteredLetters)

                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[5], binary: "01101001", correctLetter: "I", correctPosition: 5, enteredLetters: $enteredLetters)

                                        }
                                        HStack{
                                            frameStruct(someText: $enteredLetters[6], binary: "01111000", correctLetter: "X", correctPosition: 6, enteredLetters: $enteredLetters)

                                            
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
                
                
            .onAppear {
                UserDefaults.standard.set("scenarioPageTask5", forKey: "leftOff")
                    }
        
            .navigationBarBackButtonHidden()
            .ignoresSafeArea(.keyboard, edges: .bottom) // Prevents UI from shifting when the keyboard appears
            .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Information")
                        isShowingPopup.toggle()
                    } label: {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.white)
                    }
                }
                
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
    scenarioPageTask5()
}



extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
