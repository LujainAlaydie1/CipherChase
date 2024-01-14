//
//  progressTracking6.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 11/01/2024.
//

import SwiftUI

struct progressTracking6: View {
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false
    @State private var progress: Double =  6 / 6
    
    var body: some View {
        ZStack{
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                
                VStack(spacing: -20) {
                    
                    ZStack(alignment: .leading) {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(.accents) // Set the color for the filled part
                            .padding([.leading, .trailing], 35)
                        
                        Image("trophey")
                            .resizable()
                            .scaledToFit() // Maintain the aspect ratio while resizing
                            .frame(width: 21, height: 16)
                            .offset(x: CGFloat(progress) * 350) // Adjust the offset based on the progress
                    }
                }
                
                .alert(isPresented: $isShowingPopup) {
                    Alert(
                        title: Text("Information"),
                        message: Text("Decode the binary letters to figure out the word it spells"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                    
                wigglyLine()
                    .frame(width: 251.70659, height: 385)
                    .foregroundColor(Color(red: 0.56, green: 0.7, blue: 0.72)) // Change to the desired color
                    .padding(.top, geometry.size.height / 4)
                    .padding(.leading, geometry.size.width / 7)
                Circle()
                    .foregroundColor(.accents)
                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 4.8)
                    .padding(.leading, geometry.size.width / 3)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 4)
                                .padding(.leading, geometry.size.width / 2.8)
                            
                            Text("Task 1")
                                .offset(y: 10)
                                .padding(.leading, geometry.size.width / 2.8)
                                .foregroundColor(.white)
                            
                        }//vstack
                    }//overlay
                
                Circle()
                    .foregroundColor(.accents)

                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 3)
                    .padding(.leading, geometry.size.width / 5.3)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 2.6)
                                .padding(.leading, geometry.size.width / 5)
                            
                            Text("Task 2")
                                .offset(y: 10)
                                .padding(.leading, geometry.size.width / 6.3)
                                .foregroundColor(.white)

                        }//vstack
                    }//overlay
                Circle()
                    .foregroundColor(.accents)
                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 2.4)
                    .padding(.leading, geometry.size.width / 1.5)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 2.16)
                                .padding(.leading, geometry.size.width / 1.45)
                            
                            Text("Task 3")
                                .offset(y: 20)
                                .padding(.leading, geometry.size.width / 1.5)
                                .foregroundColor(.white)

                        }//vstack
                    }//overlay
                
                
                Circle()
                    .foregroundColor(.accents)

                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 2.15)
                    .padding(.leading, geometry.size.width / 3)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 1.95)
                                .padding(.leading, geometry.size.width / 2.85)
                            
                            Text("Task 4")
                                .offset(y: 10)
                                .padding(.leading, geometry.size.width / 3)
                                .foregroundColor(.white)

                        }//vstack
                    }//overlay
                
                
                Circle()
                    .foregroundColor(.accents)

                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 1.65)
                    .padding(.leading, geometry.size.width / 5.3)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 1.54)
                                .padding(.leading, geometry.size.width / 5)
                            
                            Text("Task 5")
                                .offset(y: 10)
                                .padding(.leading, geometry.size.width / 6.3)
                                .foregroundColor(.white)
                            

                        }//vstack
                    }//overlay
                
                Circle()
                    .foregroundColor(.accents)

                    .frame(width: 60, height: 60)
                    .padding(.top, geometry.size.height / 1.4)
                    .padding(.leading, geometry.size.width / 1.5)
                    .overlay{
                        VStack{
                            Image("trophey")
                                .padding(.top, geometry.size.height / 1.3)
                                .padding(.leading, geometry.size.width / 1.45)
                            
                            Text("Task 6")
                                .offset(y: 10)
                                .padding(.leading, geometry.size.width / 1.5)
                                .foregroundColor(.white)

                        }//vstack
                    }//overlay
                
                
                
                

            }//geometry
            HStack {
                 GeometryReader { geometry in
                     RoundedRectangle(cornerRadius: 15)
                         .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                         .padding([.leading, .trailing], geometry.size.width / 3)
                         .padding(.top, geometry.size.height / 1.1)
                         .foregroundColor(.secondarys)
                         .overlay{
                             RoundedRectangle(cornerRadius: 15)
                                 .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                                 .padding([.trailing], geometry.size.width / 44)
                                 .padding(.top, geometry.size.height / 1.12)
                                 .foregroundColor(.accents)
                                 .overlay{
                                     Button(action: {
                                         router.navigate(to: .ending)
                                     }) {
                                         Text("Next")
                                             .font(Font.custom("PixelifySans-Bold.ttf", size: 22))
                                             .foregroundColor(.secondarys)
                                             .frame(width: geometry.size.width / 4, height: geometry.size.height / 13)
                                             .background(
                                                 RoundedRectangle(cornerRadius: 15)
                                                     .foregroundColor(.accents)
                                             )
                                     }
                                     .padding([.trailing], geometry.size.width / 44)
                                     .padding(.top, geometry.size.height / 1.12)
                                 }
                             
                         }
                 }
             }

            .contentShape(Rectangle())

            Image("ones")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .offset(y:220)
                .allowsHitTesting(false)  // Disable user interaction
            
            

        }//zstack
        
    .onAppear {
        UserDefaults.standard.set("scenarioPageTask5", forKey: "leftOff")
            }

    .navigationBarBackButtonHidden()
    .ignoresSafeArea(.keyboard, edges: .bottom) // Prevents UI from shifting when the keyboard appears
    .onTapGesture {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

}
    .toolbar {
        
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
        

    }//body
}

#Preview {
    progressTracking6()
}
