//
//  Cipher_ChaseApp.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 22/11/2023.
//

import SwiftUI

@main
struct Cipher_ChaseApp: App {
    @ObservedObject var router = Router()
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white ]

    }
    
    var body: some Scene {

        
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashScreen()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .mainPage:
                            MainPage()
                        case .Startpage:
                            startPage()
                        case .scenariopagesh:
                            scenarioPagesH()
                        case .crosswordTask:
                            crosswordTask1()
                        case .scenarios1:
                            scenario1()
                        case .task2:
                            task2()
                        case .scenarios2:
                            scenario2()
                        case .tassk3:
                            Task3()
                        case .scenario3:
                            Senario_1_Amira()
                        case .binaryconvert:
                            binaryConversion()
                        case .continueP:
                            continuePage()
                        case .maha:
                            Qmaha()
                        case .scenario4:
                            mahas_senarios()
                        case .scenario5:
                            scenarioPageTask5()
                        case .task5:
                            winTask5()
                        case .ending:
                            endScenario()
                        }
                        
                    }
            }
            .environmentObject(router)
        }
    }
}
