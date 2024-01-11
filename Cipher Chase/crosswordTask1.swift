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
    
    @State private var progress: Double = 1 / 6
    var correctNumbers: [String] = ["5", "9"]


    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    @SceneStorage("currentPage") var currentPage: String?
    
    @EnvironmentObject var router: Router

    @State var home: Bool = false
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
    @State private var isShowingPopup = false

    
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
                    router.navigate(to: .progress1)
                }
            }
        }
    }
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                     (Decode the binary sequence and distill it down to two digits.)
                                                    """)
        let matches = pattern.matches(in: text, range: NSRange(text.startIndex..., in: text))

        var styledText = Text("")
        var currentIndex = text.startIndex

        for match in matches {
            let range = Range(match.range, in: text)!
            let beforeText = Text(text[currentIndex..<range.lowerBound])
                .font(Font.system(size: 16))
                .foregroundColor(.white)

            let matchText = Text(text[range])
                .font(Font.system(size: 16))
                .foregroundColor(.accents)

            styledText = styledText + beforeText + matchText

            currentIndex = range.upperBound
        }

        let remainingText = Text(text[currentIndex...])
            .font(Font.system(size: 16))
            .foregroundColor(.white)

        return styledText + remainingText
    }


    
    var body: some View {
        ZStack{
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            .alert(isPresented: $isShowingPopup) {
                Alert(
                    title: Text("Information"),
                    message: Text("try to decode the binary number to its equivalent decimal number."),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            
            ScrollView{
                VStack(spacing: -20){
                    
//                    ZStack(alignment: .leading) {
//                        ProgressView(value: progress)
//                            .progressViewStyle(LinearProgressViewStyle())
//                            .accentColor(.accents) // Set the color for the filled part
//                        
//                        Image("trophey")
//                            .resizable()
//                            .scaledToFit() // Maintain the aspect ratio while resizing
//                            .frame(width: 21, height: 16)
//                            .offset(x: CGFloat(progress) * 200) // Adjust the offset based on the progress
//                    }

                    
                    
                    GeometryReader { geometry in
                        styledText(for: animateTitle)
                            .font(Font.system(size: 16))
                            .padding(.horizontal)
                            .padding(.top, geometry.safeAreaInsets.top + 30) // Adjust for top safe area
                            .padding([.leading, .trailing]) // Adjust padding as needed
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true) // Prevent shrinking in the horizontal direction
                        
                            .onAppear{
                                startAnimation()
                            }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(white: 1, opacity: 0.14))
                            .padding([.leading, .trailing], -3)
                            .frame(width: 350 , height: 400) //height 400 fixes the text, og is 500
                        
                        VStack{
                            VStack{
                                
                                HStack{
                                    crosswordBlockH(text: $one)
                                        .padding(.trailing, 30)
                                }
                                
                                HStack{
                                    crosswordBlockH(text: $zero)
                                    crosswordBlockH(text: $one)
                                    crosswordBlockH(text: $zero)
                                    crosswordBlockH(text: $one)
                                    Text("=")
                                        .font(Font.custom("AnonymousPro-Bold", size: 35))
                                        .fontWeight(.bold)
                                        .foregroundColor(.logocolor)
                                    frameStructH(someText: $enteredLetters[0], correctNumbers: ["5"])
                                }
                                
                                HStack{
                                    crosswordBlockH(text: $zero)
                                        .padding(.trailing, 30)
                                }
                                
                                HStack{
                                    crosswordBlockH(text: $one)
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
                                    frameStructH(someText: $enteredLetters[1], correctNumbers: ["9"])
                                        .padding(.trailing, 30)
                                }
                                //.padding(.bottom, 100)
                            }//VStack
                            .onReceive(enteredLetters.publisher, perform: { _ in checkAllFilled()})
                            
                            //.padding(.bottom, -100)
                            
                        }//VStack
                        
                    }//ZStack
                    .offset(y: 200)
                    
                    
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
            .onAppear {
                if let lastViewedPage = UserDefaults.standard.string(forKey: "crosswordTask1") {
                    currentPage = lastViewedPage
                }
            }
            .onDisappear {
                UserDefaults.standard.set(currentPage, forKey: "crosswordTask1")
            }
            .navigationTitle("Task 1")
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
            
            .onTapGesture {
                // Dismiss the keyboard when tapping outside the text field
                hideKeyboard()
            }
        }

        
    }
    private func hideKeyboard() {
        #if os(iOS)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        #endif
    }
    
}

struct crosswordBlockH: View{
    
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
    @State private var isCorrect: Bool = false
    var correctNumbers: Set<String> = ["5", "9"]
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                    TextField("   ", text: $someText)
                        .foregroundColor(isCorrect ? .black : .red) // Set text color based on correctness
                        .font(Font.custom("AnonymousPro-Bold", size: 35))
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .onChange(of: someText) { newText in
                            limitToOneDigit()
                            updateCorrectness()
                            
                        }
                )
        }
        .onAppear {
            UserDefaults.standard.set("StartPage", forKey: "leftOff")
            limitToOneDigit()
        }
    }
    
    private func updateCorrectness() {
        isCorrect = correctNumbers.contains(someText.lowercased())
    }
    
    private func limitToOneDigit() {
        if someText.count > 1 {
            someText = String(someText.prefix(1))
        }
    }

}
