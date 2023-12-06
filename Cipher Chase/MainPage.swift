//
//  MainPage.swift
//  Cipher Chase
//
//  Created by haifa alfoiz on 23/11/2023.
//

import SwiftUI

struct MainPage: View {
    
    
    @State private var path = NavigationPath()
    @State private var navigateToNextView = false
    @SceneStorage("currentPage") var currentPage: String?
    @State private var isNavigationActive = false


    func navigateToLastViewedPage() {
        // Navigate to the last viewed page
        // Here, you might use a NavigationLink, or other navigation mechanism
        // For simplicity, it's left as a print statement
        if let currentPage = currentPage {
            print("Navigating to last viewed page: \(currentPage)")
            
        }
    }
    
    
    func destinationViewForPage() -> some View {
           switch UserDefaults.standard.string(forKey: "leftOff") {
               case "startPage":
                   return AnyView(startPage())
                case "scenarioPagesH":
               return AnyView(scenarioPagesH())
           case "crosswordTask1":
               return AnyView(crosswordTask1())
               
           case "scenario1":
               return AnyView(scenario1())
               
           case "task2":
               return AnyView(task2())
           case "scenario2":
               return AnyView(scenario2())
           case "Task3":
               return AnyView(Task3())
           case "Senarios Amira":
               return AnyView(Senario_1_Amira())
           case "Qmaha":
               return AnyView(Qmaha())
           case "task4q":
               return AnyView(task4q())
           case "mahas_senarios":
               return AnyView(mahas_senarios())
           case "winTask5":
               return AnyView(winTask5())
           case "endScenario":
               return AnyView(endScenario())
           case "binaryConversion":
               return AnyView(binaryConversion())
           case "continuePage":
               return AnyView(continuePage())
           case "traceView":
               return AnyView(traceView())
               // Handle other cases similarly

               default:
                   return AnyView(EmptyView())
           }
       }
    
    
    var body: some View {
        
        if  self.navigateToNextView{
            startPage()
            
        }else{
            
            NavigationStack(path: $path) {
                ZStack{
                    Color(.background)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0){ // Title
                        
                        Spacer()
                        
                        Text("Cipher")
                            .font(Font.custom("PixelifySans-Bold", size: 64))
                            .shadow(color: Color.black, radius: 4, x: 4, y: 3)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.accents, .secondarys],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Text("Chase")
                            .font(Font.custom("PixelifySans-Bold", size: 64))
                            .shadow(color: Color.black, radius: 4, x: 4, y: 3)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.accents, .secondarys],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Capsule()
                            .fill(Color.logocolor)
                            .frame(width: 180 ,height: 24)
                            .overlay(
                                Text("Crack the Case")
                                    .font(Font.custom("PixelifySans-Bold", size: 16))
                                    .foregroundStyle(.secondarys)
                            )
                        
                        Spacer()
                        
                        VStack(spacing: 20){
                            
                            Button("New Game"){
                                navigateToNextView = true
                            }
                            .buttonStyle(BlueButton())
                            
                            
                            Button(" Continue  "){
                                let retrievedPage = UserDefaults.standard.string(forKey: "leftOff")
                                
                                switch retrievedPage{
                                case "startPage":
                                    isNavigationActive = true

                                    break
                                case "scenarioPagesH":
                                    isNavigationActive = true
                                    break
                                case "crosswordTask1":
                                    isNavigationActive = true
                                    break
                                    
                                case "scenario1":
                                    isNavigationActive = true
                                    break
                                    
                                case "task2":
                                    isNavigationActive = true
                                    break
                                case "scenario2":
                                    isNavigationActive = true
                                    break

                                case "Task3":
                                    isNavigationActive = true
                                    break

                                case "Senarios Amira":
                                    isNavigationActive = true
                                    break

                                case "Qmaha":
                                    isNavigationActive = true
                                    break

                                case "task4q":
                                    isNavigationActive = true
                                    break

                                case "mahas_senarios":
                                    isNavigationActive = true
                                    break

                                case "winTask5":
                                    isNavigationActive = true
                                    break

                                case "endScenario":
                                    isNavigationActive = true
                                    break

                                case "binaryConversion":
                                    isNavigationActive = true
                                    break

                                case "continuePage":
                                    isNavigationActive = true
                                    break

                                case "traceView":
                                    isNavigationActive = true
                                    break

                                case .none:
                                    break
                                case .some(_):
                                    break
                                }

                                
                                
                            }
                            .buttonStyle(BlueButton())
                            .background(NavigationLink(
                                destination: destinationViewForPage().navigationBarBackButtonHidden(), // Call a method to determine the destination view
                                                isActive: $isNavigationActive,
                                                label: { EmptyView() }
                                            ))
                            
                            Button("     About     "){
                                
                            }
                            .buttonStyle(BlueButton())
                            
                        }
                        
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                    }
                }
            }
           
        }
        
    }
}

 struct BlueButton: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.logocolor)
            .frame(width: 190, height: 50)
            .foregroundStyle(.secondarys)
            .font(Font.custom("PixelifySans-Bold", size: 32))
            .cornerRadius(15)
            .shadow(color: Color.secondarys, radius: 0, x: 5, y: 7)
    }
}

#Preview {
    MainPage()
}
