//
//  router.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 08/01/2024.
//
import Foundation
import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case mainPage
        case Startpage
        case scenariopagesh
        case crosswordTask
        case scenarios1
        case task2
        case scenarios2
        case tassk3
        case scenario3
        case binaryconvert
        case continueP
        case maha
        case scenario4
        case scenario5
        case task5
        case ending
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
