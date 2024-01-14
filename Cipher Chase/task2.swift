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
    
    @State private var progress: Double = 2 / 6
    var correctIndex = 3
    func styledText(for text: String) -> Text {
        let pattern = try! NSRegularExpression(pattern: """
                                                    (click on the line that echoes with the error)
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
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false

    var body: some View {
            ZStack {
                Color(.background)
                    .edgesIgnoringSafeArea(.all)
                
                    .alert(isPresented: $isShowingPopup) {
                        Alert(
                            title: Text("Information"),
                            message: Text("Click the line that contains the error."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                
                VStack(spacing: -20){
                
                    VStack{
                        GeometryReader { geometry in
                            styledText(for: animateTitle)
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
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .size(width: 333, height: 304)
                                .foregroundColor(Color(white: 1, opacity: 0.14))
                                .padding([.leading, .trailing], 30)
                            
                            VStack(alignment: .leading, spacing: 1.25) {
                                ForEach(0..<sentences.count) { index in
                                    Text(sentences[index])
                                        .padding(.vertical, 1)
                                        .font(Font.system(size: 16))
                                        .foregroundColor(selectedLine == index ? (index == correctIndex ? .green : .red) : .white)
                                        .onTapGesture {
                                            if index == correctIndex {
                                                // If selected line is correct, navigate to the next scenario
                                                selectedLine = index
                                                router.navigate(to: .progress2)
                                            } else {
                                                // If selected line is incorrect, highlight in red and then reset
                                                selectedLine = index
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    selectedLine = nil
                                                }
                                            }
                                        }
                                }
                            }.frame(width: 302, height: 265)
                                .padding(.leading, 30.0)//spacing: 1.25,
                            
                            
                            
                        }

                    }
                    Image("ones")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .allowsHitTesting(false)
                }
            }
            .onAppear {
                UserDefaults.standard.set("task2", forKey: "leftOff")
            }
            .navigationTitle("Task 2")
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
    task2()
}
