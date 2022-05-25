//
//  RescheduleView.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//

import SwiftUI

struct RescheduleView: View {
    let reminderViewModel: ReminderModel
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: -60), count: 2)
    var body: some View {
        ScrollView {
            VStack {
                Text("Reschdule for \(reminderViewModel.reminders[0].time)")
                    .font(.footnote)
                Button(action: {
                    print("Round Action")
                }) {
                    Text("Add")
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    
                }
                .accessibilityAddTraits(.isButton)
                .accessibilityRespondsToUserInteraction(true)
                .buttonStyle(PlainButtonStyle())
                
                RescheduleButtonView()
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRespondsToUserInteraction(true)
            }
        }
    }
}
