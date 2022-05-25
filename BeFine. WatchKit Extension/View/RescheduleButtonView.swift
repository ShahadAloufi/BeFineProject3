//
//  RescheduleButtonView.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//

import SwiftUI
struct RescheduleButtonView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: -50), count: 2)
    let availableTimes = [10, 30, 60, 120]
    var body: some View {
        VStack {
            LazyVGrid(columns: columns){
                ForEach(availableTimes, id: \.self) { availableTimes in
                    Button("\(availableTimes)\nMin"){
                    }
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRespondsToUserInteraction(true)
                    .frame(width: 56, height: 60)
                    .foregroundColor(Color.black)
                    .background(Color.blue)
                    .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        
    }
}
