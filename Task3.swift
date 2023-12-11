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
            Senario_1_Amira()
        //diala's page
        .transition(.move(edge: .bottom))
        }else{
            
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Decipher the hexadecimal whispers. The key awaits your binary touch")
                    .padding(.top, 40)
                    .font(Font.custom("Pixelify Sans", size: 16))
                    .kerning(1.6)
                    .foregroundColor(.white)
                    .frame(width: 300)
                
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
                            .font(Font.custom("Pixelify Sans", size: 16))
                            .kerning(1.6)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 120)
                            .padding(.bottom, 10)
                        
                        VStack(spacing: 15) {
                            HStack {
                                // First three text fields with correct letters
                                frameStructA(someText: $enteredLetters[0],  correctLetters: "A")
                                frameStructA(someText: $enteredLetters[1],  correctLetters: "0")
                                frameStructA(someText: $enteredLetters[2],  correctLetters: "C")
                                
                                
                            }
                            HStack {
                                // Last three text fields with results of letters
                                boxView(text: "10")
                                boxView(text: "0")
                                boxView(text: "12")
                                
                            }
                        }
                        .onReceive(enteredLetters.publisher, perform: { _ in checkAllFilled()})
                    }}}}}}}
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
    //@State var binary: String
    var correctLetters: String
    var body: some View {
        
        HStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(7)
                        .padding([.leading])
                        .padding(.top)
                        .overlay(
                            TextField("   ", text: $someText)
                                .foregroundColor(.black)
                                .font(Font.custom("AnonymousPro-Bold", size: 35))
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                                .padding(.top)
                                .onChange(of: someText) {
                                    if someText.count > 1 {
                                        someText = String(someText.prefix(1))
                                    }
                                })}}}
#Preview {
    Task3()
}
