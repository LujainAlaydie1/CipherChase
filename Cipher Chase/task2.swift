//
//  task2.swift
//  Cipher Chase
//
//  Created by Diala Masoud on 28/11/2023.
//

import SwiftUI


struct task2: View {
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.01
    @State private var clickCount = 0
    @State var animateTitle: String = ""
    @State var finalText: String =  """
    "In the labyrinth of code, where bugs dance in the shadows, your path lies in the unexpected. Seek the anomaly, click on the line that echoes with the error, and unravel the next clue hidden within the missteps of the code."
"""
    
    @State private var navigateToNextView = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()
    
    
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
    let sentences = [
        "def calculate_sum():",
        "    numbers = [1, 2, 3, 4, 5]",
        "    sum = 0",
        "    for i in range(1, len(numbers) + 1):",
        "        sum += numbers[i]",
        "    return sum",
        "",
        "result = calculate_sum()",
        "print(\"The sum is:\", result)"
    ]
    
    @State private var selectedLine: Int?
    @State private var navigateToNextPage = false
    
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                GeometryReader { geometry in Text(animateTitle)
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
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .size(width: 333, height: 304)
                        .foregroundColor(Color(white: 1, opacity: 0.14))
                        .padding([.leading, .trailing], 30)
                    
                    VStack(alignment: .leading , spacing: 1.25){
                        ForEach(0..<sentences.count) { index in
                            Text(sentences[index])
                            
                                .padding(.vertical, 1)
                            
                                .font(Font.custom("AnonymousPro-Regular", size: 16))
                                .foregroundColor(selectedLine == index ? .red : .white)
                                .onTapGesture {
                                    if index == 3 {
                                        selectedLine = index
                                        navigateToNextPage = true
                                        
                                        
                                    } else {
                                        selectedLine = nil
                                        navigateToNextPage = false
                                    }
                                }
                        }
                    }.frame(width: 302, height: 265)
                    .padding(.leading, 30.0)//spacing: 1.25,
                    
                    
                    
                }
                .fullScreenCover(isPresented: $navigateToNextPage) {
                    scenario2()
                }
                Image("ones")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .offset(y:225)
                    .allowsHitTesting(false)
            }
        }
        
        
        
        
    }
}
#Preview {
    task2()
}
