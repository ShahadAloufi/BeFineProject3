//
//  CoreData.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 16/05/2022.
//


import CoreData
//
//class DataController: ObservableObject {
//
//    let container = NSPersistentContainer(name: "ReminderModel")
//
//    init(){
//
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("core data didnt work\(error.localizedDescription)")
//            }
//        }
//    }
//
//
//
//}
//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "ReminderModel")
//        if inMemory{
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//        container.loadPersistentStores(completionHandler: {(storeDescription, error)in
//            if let error = error as NSError?{
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//    }




//    override open class func defaultDirectoryURL() -> URL {
//        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.myfirstappsh.BeFine")
//        storeURL = storeURL?.appendingPathComponent("ReminderModel")
//        return storeURL!
//    }
//}
//class CoreDataManager {
//
//    let persistentContainer: NSPersistentContainer
//    static let shared: CoreDataManager = CoreDataManager()
//
//    private init() {
//
//        persistentContainer = NSPersistentContainer(name: "ReminderModel")
//        persistentContainer.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to initialize Core Data \(error)")
//            }
//        }
//
//    }
//
//}


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
    
    
    
    public func send(movieIds: [Int]) {
      guard WCSession.default.activationState == .activated else {
        return
      }
        
        // 1
        #if os(watchOS)
        // 2
        guard WCSession.default.isCompanionAppInstalled else {
          return
        }
        #else
        // 3
        guard WCSession.default.isWatchAppInstalled else {
          return
        }
        #endif
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
