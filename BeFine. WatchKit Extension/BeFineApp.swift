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
   // var book = HomeView2()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                  //  .environmentObject(book)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
