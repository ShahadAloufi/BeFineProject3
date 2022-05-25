//
//  RowDetailView.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//
import SwiftUI
import WatchConnectivity
import UIKit
import WatchKit

struct RowDetailView: View {
    let reminderViewModel: ReminderType
    @State var buttonIsPressed: Bool
    @State var skipButtonPressed: Bool
     var reminderViewModel2: ReminderModel = ReminderModel()
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: TypeDetailView(reminderViewModel: reminderViewModel2, buttonIsPressed: $buttonIsPressed, skipButtonPressed: $skipButtonPressed ), label:{
                        HStack {
                            VStack(alignment: .leading){
                                Text(reminderViewModel2.reminders[0].time)
                                    .accessibilityAddTraits(.isButton)
                                Text("\(reminderViewModel2.reminders[0].name)")
                                    .accessibilityAddTraits(.isButton)
                            }
                            Spacer()
                            if buttonIsPressed == true {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                            }else if skipButtonPressed == true {
                                Image(systemName: "exclamationmark")
                                    .foregroundColor(.red)
                                    .font(.headline)
                            }
                            
                        }
                    })
                
                    .navigationTitle(reminderViewModel.titleOfReminder)
            }
        }
      
    }
    
}

