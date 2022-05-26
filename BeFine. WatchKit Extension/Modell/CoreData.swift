//
//  CoreData.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 16/05/2022.
//


import Foundation
// 1
import WatchConnectivity

final class Connectivity: NSObject {
  // 2
  static let shared = Connectivity()

  // 3
    override private init() {
        super.init()
      
        
    // 4
    #if !os(watchOS)
    guard WCSession.isSupported() else {
      return
    }
    #endif

    // 5
    WCSession.default.delegate = self
    WCSession.default.activate()
  }
    
    
}

// MARK: - WCSessionDelegate
extension Connectivity: WCSessionDelegate {
  func session(
      _ session: WCSession,
      activationDidCompleteWith activationState: WCSessionActivationState,
      error: Error?
  ) {
  }
#if os(iOS)
func sessionDidBecomeInactive(_ session: WCSession) {
}

func sessionDidDeactivate(_ session: WCSession) {
    
    WCSession.default.activate()
}
#endif
    
    
}
