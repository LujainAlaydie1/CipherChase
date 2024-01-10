//
//  task3.swift
//  Cipher Chase
//
//  Created by AMIRA on 12/05/1445 AH.
//


import SwiftUI

struct Task3: View {
    
    @State private var enteredLetters: [String] = ["", "", ""]
    @State private var isActive: Bool = false
    
    
    func checkCorrectness() -> Bool {
        let correctLetters = ["A", "0", "C"]
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
                    router.navigate(to: .scenario3)
                }
            }
        }
        else{
        }
    }
    
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false
    @State private var progress: Double = 3 / 6
    
    private func hideKeyboard() {
#if os(iOS)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
    }
    
    
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack(spacing: -20) {
                    
                    ZStack(alignment: .leading) {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(.accents) // Set the color for the filled part
                        
                        Image("trophey")
                            .resizable()
                            .scaledToFit() // Maintain the aspect ratio while resizing
                            .frame(width: 21, height: 16)
                            .offset(x: CGFloat(progress) * 330) // Adjust the offset based on the progress
                    }
                    
                    .alert(isPresented: $isShowingPopup) {
                        Alert(
                            title: Text("Information"),
                            message: Text("Match the hexadecimal number to the equivalent digit."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    Text("\"Decipher the hexadecimal whispers. The key awaits your binary touch\"")
                        .padding(.top, 40)
                        .font(Font.system(size: 16))
                        .kerning(1.6)
                        .foregroundColor(.white)
                        .offset(y:-10)
                        .frame(width: 300)
                        .padding(.bottom)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .size(width: 333, height: 600)
                            .foregroundColor(Color(white: 1, opacity: 0.14))
                            .padding([.leading, .trailing], 30)
                        
                        VStack {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.white)
                                VStack(spacing: 5) {
                                    DigitView(digit: "A")
                                    HStack(spacing: 75) {
                                        DigitView(digit: "0")
                                        DigitView(digit: "8")
                                    }
                                    HStack(spacing: 5) {
                                        DigitView(digit: "F")
                                        DigitView(digit: "C")
                                    }
                                }
                            }
                            
                            Text("Write the scrambled letters on the first box to create a hexadecimal numeral system, Converting  to THE decimal numeral system excited.")
                                .padding(.top)
                                .font(Font.system(size: 16))
                                .kerning(1.6)
                                .foregroundColor(.white)
                                .frame(width: 310, height: 120)
                                .padding(.bottom, 10)
                            
                            VStack(spacing: 15) {
                                HStack {
                                    // First three text fields with correct letters
                                    // First three text fields with correct letters
                                    frameStructA(someText: $enteredLetters[0], correctLetter: "A", correctPosition: 0, enteredLetters: $enteredLetters)
                                    frameStructA(someText: $enteredLetters[1], correctLetter: "0", correctPosition: 1, enteredLetters: $enteredLetters)
                                    frameStructA(someText: $enteredLetters[2], correctLetter: "C", correctPosition: 2, enteredLetters: $enteredLetters)
                                }
                                HStack {
                                    // Last three text fields with results of letters
                                    boxView(text: "10")
                                    boxView(text: "0")
                                    boxView(text: "12")
                                    
                                }
                            }
                            .onReceive(enteredLetters.publisher, perform: { _ in checkAllFilled()})
                        }
                        .offset(y: 30)
                    }
                    
                }
            }
            .onTapGesture {
                // Dismiss the keyboard when tapping outside the text field
                hideKeyboard()
            }
            
        }
        .navigationTitle("Task 3")
        .navigationBarBackButtonHidden()
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Information")
                    isShowingPopup.toggle()
                } label: {
                    Image(systemName: "info.circle")
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
struct Task3_Previews: PreviewProvider {
    static var previews: some View {
        Task3()
    }
}

struct DigitView: View {
    let digit: String
    var body: some View {
        Text(digit)
            .font(Font.custom("Inter", size: 50))
            .foregroundColor(Color(red: 0.01, green: 0.19, blue: 0.27))
            .frame(width: 50, height: 50)
    }
}

struct boxView: View {
    let text: String
    var body: some View {
        Text(text)
            .frame(width: 50, height: 50)
            .background(Color.white)
            .font(Font.custom("Inter", size: 35))
            .foregroundColor(Color.black)
            .cornerRadius(7)
            .padding(.leading)
        
    }
}

struct frameStructA: View {
    @Binding var someText: String
    var correctLetter: String
    var correctPosition: Int
    @State private var isCorrect: Bool = false
    @Binding var enteredLetters: [String]
    
    var body: some View {
        
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(7)
                .padding([.leading])
                .padding(.top)
                .overlay(
                    TextField("   ", text: $someText)
                        .foregroundColor(isCorrect ? .black : .red) // Set text color based on correctness
                        .font(Font.custom("AnonymousPro-Bold", size: 35))
                        .fontWeight(.bold)
                        .padding(.leading, 30)
                        .padding(.top)
                    
                        .onChange(of: someText) { newText in
                            limitToOneDigit()
                            updateCorrectness()
                        }
                )
        }
        .onAppear {
            UserDefaults.standard.set("Task3", forKey: "leftOff")
        }
    }
    
    private func updateCorrectness() {
        isCorrect = enteredLetters[correctPosition] == correctLetter
        
    }
    
    private func limitToOneDigit() {
        if someText.count > 1 {
            someText = String(someText.prefix(1))
        }
    }
}




#Preview {
    Task3()
}
