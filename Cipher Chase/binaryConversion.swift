//
//  binaryConversion.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 28/11/2023.
//


import SwiftUI
import Combine

struct binaryConversion: View {
    
    @State var isActive: Bool = false
    @State var animateTitle: String = ""
    @State var finalText: String = """
   In the Cryptic Code Chamber, the holographic terminal presents a series of binary addition equations. The elite coding team's task is to calculate the binary sum for each equation correctly. Successfully solving these binary addition challenges will unlock crucial fragments of information about The Encoder's encrypted messages, bringing the team closer to unraveling the mysteries held within "Project_Phoenix."
 """
    
    @State var showTextFieldAlert : Bool = false
    @State var showList: Bool = true
    @State var textFieldValue: String = ""
    
    @State var one: String = "1"
    @State var zero: String = "0"
    @State var answr: String = " "
    @State private var placeHolders1: [String] = ["","","",""]
    @State private var placeHolders2: [String] = ["","","",""]
    @State private var enteredLetters2: [String] = ["","","",""]

    @State private var enteredLetters: [String] = ["","","",""]
    @State var empty = " "

    
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
        let correctLetters = ["1", "1", "0", "0"]
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
            if checkCorrectness(){
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    router.navigate(to: .progress4)
                }
            }
        } else {
        }
    }
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false
    @State private var progress: Double = 4 / 6
    
    var body: some View {
                ZStack {
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                        .alert(isPresented: $isShowingPopup) {
                            Alert(
                                title: Text("Information"),
                                message: Text("Perform binary addition to find the answer."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    VStack(spacing: -20) {

                        

                        GeometryReader { geometry in
                            Text(animateTitle)
                                .font(Font.system(size: 16))
                                .padding(.horizontal)
                                .padding(.top, geometry.safeAreaInsets.top + 25) // Adjust for top safe area
                                .padding([.leading, .trailing]) // Adjust padding as needed
                                .offset(y: -100)
                            
                            
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .onAppear{
                                    startAnimation()
                                }
                            
                        }
                        Spacer()
                        
                        GeometryReader { geometry in
                            ScrollView{
                            ZStack{
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(white: 1, opacity: 0.14))
                                        .padding([.leading, .trailing]) // Adjust padding as needed
                                        .padding(.top,  geometry.size.height  / 3.6)
                                        .frame(width: geometry.size.width, height: geometry.size.height * 1.43)
                                        .overlay {
                                            VStack(){
                                                HStack{
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders1[0], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders1[1], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    crosswordBlock(text: $zero, someText: $placeHolders1[2], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders1[3], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    
                                                    
                                                }.padding([.trailing, .leading], geometry.size.width / 10)
                                                    .padding(.bottom, geometry.size.height / 5)
                                                    .padding(.top, geometry.size.height / -7)
                                                Text("+")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 32))
                                                    .padding(.top, geometry.size.height / -7)
                                                
                                                    .padding(.bottom, geometry.size.height / 9)
                                                
                                                HStack{
                                                    
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders2[0], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    
                                                    crosswordBlock(text: $zero, someText: $placeHolders2[1], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders2[2], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                    crosswordBlock(text: $one, someText: $placeHolders2[3], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters2, x: false)
                                                    
                                                }.padding([.trailing, .leading], geometry.size.width / 10)
                                                    .padding(.bottom, geometry.size.height / 5)
                                                    .padding(.top, geometry.size.height / -7)
                                                
                                                Text("=")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 32))
                                                    .padding(.bottom, geometry.size.height / 5)
                                                    .padding(.top, geometry.size.height / -7)
                                                
                                                HStack{
                                                    crosswordBlock(text: $empty, someText: $enteredLetters[0], correctLetter: "1", correctPosition: 0, enteredLetters: $enteredLetters, x: true)
                                                    
                                                    crosswordBlock(text: $empty, someText: $enteredLetters[1], correctLetter: "1", correctPosition: 1, enteredLetters: $enteredLetters, x: true)
                                                    
                                                    crosswordBlock(text: $empty, someText: $enteredLetters[2], correctLetter: "0", correctPosition: 2, enteredLetters: $enteredLetters, x: true)
                                                    
                                                    crosswordBlock(text: $empty, someText: $enteredLetters[3], correctLetter: "0", correctPosition: 3, enteredLetters: $enteredLetters, x: true)
                                                    
                                                }.padding([.trailing, .leading], geometry.size.width / 10)
                                                    .padding(.bottom, geometry.size.height / 5)
                                                    .padding(.top, geometry.size.height / -7)
                                                
                                                
                                            }
                                            .padding([.top], geometry.size.height / 2)
                                         
                                            Spacer()
                                            
                                        }.onReceive(enteredLetters.publisher, perform: { _ in
                                            checkAllFilled()
                                        })
                                    
                                }
                                .offset(y:60)
                            }
                                .offset(y: -(geometry.size.height / 2.3))  // Adjust the value based on how much you want to lift it up
                            }
                            .padding(.bottom, -100)
                            .offset(y:-100)

                            
                            
                            
                            Image("ones")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .offset(y:130)
                                .allowsHitTesting(false)  // Disable user interaction
                            
                            
                        }
                    }
//                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .contentShape(Rectangle())
                    .onTapGesture {
                            // Dismiss the keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    .ignoresSafeArea(.keyboard, edges: .all)

                    
                }
                
    
            .onAppear {
                UserDefaults.standard.set("binaryConversion", forKey: "leftOff")
                    }
            .navigationTitle("Task 4")
            .navigationBarBackButtonHidden()

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
    binaryConversion()
}
