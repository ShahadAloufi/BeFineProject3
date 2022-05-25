//
//  TypeDetailView.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//
//
import SwiftUI
import WatchConnectivity
struct TypeDetailView: View {
    @State private var showingSheet = false
    @ObservedObject public var reminderViewModel = ReminderModel()
    @Binding var buttonIsPressed: Bool
    @Binding var skipButtonPressed: Bool
    @Environment(\.presentationMode) var presentationMode
    public var body: some View {
        ScrollView {
            VStack {
                Text("Take your \(reminderViewModel.reminders[0].name), \(reminderViewModel.reminders[0].time)")
        
                Button("Take"){
                    
                    buttonIsPressed.toggle()
                    presentationMode.wrappedValue.dismiss()
                    
                }
                .accessibilityAddTraits(.isButton)
                    .accessibilityRespondsToUserInteraction(true)
                
                Button("Reschedule"){
                    showingSheet.toggle()
                }
                .accessibilityAddTraits(.isButton)
                    .accessibilityRespondsToUserInteraction(true)
                
                
                .sheet(isPresented: $showingSheet) {
                    RescheduleView(reminderViewModel: reminderViewModel)
                }
                .accessibilityAddTraits(.isButton)
                .accessibilityRespondsToUserInteraction(true)
                Button("Skip"){
                    skipButtonPressed.toggle()
                    presentationMode.wrappedValue.dismiss()
                }
                .accessibilityAddTraits(.isButton)
                .accessibilityRespondsToUserInteraction(true)
            }
            .navigationTitle(reminderViewModel.reminders[0].name)
            .padding()
           
        }
        
    }
   
    
}
