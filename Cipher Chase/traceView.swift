//
//  traceView.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 30/11/2023.
//

import SwiftUI
import Combine
struct traceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()
    @State var isActive: Bool = false
    
    
    @State private var someText = ""
    @State var animateTitle: String = ""
    @State var finalText: String = "trace the execution of this code and identify the values of variables product_result, difference_result, z, and final_result "
        
        @State private var enteredLetters: [String] = ["","","",""]
    @State private var empt: [String] = ["Product","Difference","Z","Final"]

        
        @State var indexValue = 0
        @State var timeInterval: TimeInterval = 0.1
        private var cancellables: Set<AnyCancellable> = []
        @State var empty = " "

        
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
            let correctLetters = ["50", "5", "65", "13"]
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
                checkCorrectness()
            } else {
            }
        }
        
        var body: some View {
            if self.isActive{
                task4q()
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
                                            .frame(width: geometry.size.width, height: geometry.size.height * 1.4)
                                            .padding(.top , -(geometry.size.height / 7))
                                        
                                        VStack{
                                          
                                            Text("""
                                        def calculate_sum(a, b):
                                            result = a + b
                                            product = a * b
                                            difference = abs(a - b)
                                                 
                                            return result, product, difference

                                        def main():
                                            x = 10
                                            y = 5
                                                 
                                            sum_result, product_result, difference_result = calculate_sum(x, y)
                                                 
                                            z = sum_result + product_result
                                                 
                                            if difference_result > 0:
                                                final_result = z / difference_result
                                            else:
                                                final_result = "Cannot divide by zero"
                                                 
                                            print("Final Result:", final_result)

                                        main()
                                        """).foregroundColor(.white)
                                            .font(Font.custom("AnonymousPro-Regular", size: 16))
                                            .padding(.top, -(geometry.size.height) / 16)
                                            .padding([.leading, .trailing])

                                            Spacer()
                                            
                                        }
                                        
                                        HStack{
                                            VStack{
                                                Text("Product")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 12))

                                                taskTraceStruct(text: $empty, someText: $enteredLetters[0], binary: "1",  x: true)
                                            }
                                            VStack{
                                                Text("Difference")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 12))
                                                taskTraceStruct(text: $empty, someText: $enteredLetters[1], binary: "1",  x: true)
                                            }
                                            
                                            VStack{
                                                Text("Z")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 12))
                                                
                                                taskTraceStruct(text: $empty, someText: $enteredLetters[2], binary: "0",  x: true)
                                            }
                                            VStack{
                                                Text("FinalResult")
                                                    .foregroundColor(.white)
                                                    .font(Font.custom("AnonymousPro-Regular", size: 12))
                                                taskTraceStruct(text: $empty, someText: $enteredLetters[3], binary: "0", x: true)
                                            }
                                        }.padding([.trailing, .leading], geometry.size.width / 10)
                                            .padding(.top, geometry.size.height / 0.94)
//                                            .padding(.bottom, geometry.size.height / 5)
//                                            .padding(.top, geometry.size.height / -7)
                                            .onReceive(enteredLetters.publisher, perform: { _ in
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
//                        .ignoresSafeArea(.keyboard, edges: .bottom)
                        .contentShape(Rectangle())
                        .onTapGesture {
                                // Dismiss the keyboard
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                        
                    }
                    .navigationBarHidden(true)  // Hide the navigation bar on this screen
                    
                }
                .onAppear {
                    UserDefaults.standard.set("traceView", forKey: "leftOff")
                        }
            }

        }
          }



    #Preview {
        traceView()
    }



