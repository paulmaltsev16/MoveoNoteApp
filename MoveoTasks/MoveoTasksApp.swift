//
//  MoveoTasksApp.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

@main
struct MoveoTasksApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                LoginView()
            }
        }
    }
}
