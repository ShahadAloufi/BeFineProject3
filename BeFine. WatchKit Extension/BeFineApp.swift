//
//  BeFineApp.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//

import SwiftUI
import WatchConnectivity
@main
struct BeFineApp: App {
  
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
