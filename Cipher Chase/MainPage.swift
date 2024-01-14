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
    @EnvironmentObject var router: Router

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
               
           case "progress1":
               return AnyView(progressTracking())
           case "progress2":
               return AnyView(progressTracking2())
           case "progress3":
               return AnyView(progressTracking3())
           case "progress4":
               return AnyView(progressTracking4())
           case "progress5":
               return AnyView(progressTracking5())
           case "progress6":
               return AnyView(progressTracking6())
           case "progress0":
               return AnyView(progressTrackingBefore())

               // Handle other cases similarly

               default:
                   return AnyView(EmptyView())
           }
       }
    

    
    var body: some View {
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
                        
//                        Capsule()
//                            .fill(Color.logocolor)
//                            .frame(width: 180 ,height: 24)
//                            .overlay(
//                                Text("Crack the Case")
//                                    .font(Font.custom("PixelifySans-Bold", size: 16))
//                                    .foregroundStyle(.secondarys)
//                            )
                        
                        Spacer()
                        
                        VStack(spacing: 20){
                            
                                Button("New Game"){
                                    router.navigate(to: .Startpage)
                                }
                                .buttonStyle(BlueButton())
                            
                            Button(" Continue  "){
                                
                                let retrievedPage = UserDefaults.standard.string(forKey: "leftOff")
                                print(retrievedPage ?? "Nothing")
                                switch retrievedPage{
                                case "StartPage":
                                    router.navigate(to: .Startpage)
                                    break
                                case "scenarioPagesH":
                                    router.navigate(to: .scenariopagesh)
                                    break
                                case "crosswordTask1":
                                    router.navigate(to: .crosswordTask)
                                    break
                                    
                                case "scenario1":
                                    router.navigate(to: .scenarios1)
                                    break
                                    
                                case "task2":
                                    router.navigate(to: .task2)
                                    break
                                case "scenario2":
                                    router.navigate(to: .scenarios2)
                                    break

                                case "Task3":
                                    router.navigate(to: .tassk3)
                                    break

                                case "Senarios Amira":
                                    router.navigate(to: .scenario3)
                                    break

                                case "Qmaha":
                                    router.navigate(to: .maha)
                                    break

                                case "mahas_senarios":
                                    router.navigate(to: .scenario4)
                                    break

                                case "winTask5":
                                    router.navigate(to: .task5)
                                    break

                                case "endScenario":
                                    router.navigate(to: .ending)
                                    break

                                case "binaryConversion":
                                    router.navigate(to: .binaryconvert)
                                    break

                                case "continuePage":
                                    router.navigate(to: .continueP)
                                    break

                                case "scenarioPageTask5":
                                    router.navigate(to: .scenario5)
                             
                                case "progress1":
                                    router.navigate(to: .progress1)
                                    
                                case "progress2":
                                    router.navigate(to: .progress2)
                                    
                                case "progress3":
                                    router.navigate(to: .progress3)
                                    
                                case "progress4":
                                    router.navigate(to: .progress4)
                                    
                                case "progress5":
                                    router.navigate(to: .progress5)
                                    
                                case "progress6":
                                    router.navigate(to: .progress6)
                                    
                                case "progress0":
                                    router.navigate(to: .progress0)                                case .none:
                                    break
                                case .some(_):
                                    break
                                }

                                
                                
                            }
                            .buttonStyle(BlueButton())

                            
                        }
                        
                        Image("ones")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .allowsHitTesting(false)
                    }
                }
        }
}

 struct BlueButton: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
             .frame(width: 160, height: 50)
            .padding()
            .background(Color.logocolor)
            .foregroundStyle(.secondarys)
            .font(Font.system(size: 32))
            .cornerRadius(15)
            .shadow(color: Color.secondarys, radius: 0, x: 5, y: 7)
    }
}

#Preview {
    MainPage()
}
