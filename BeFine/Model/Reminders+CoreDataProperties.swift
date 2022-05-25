//
//  Reminders+CoreDataProperties.swift
//  BeFine
//
//  Created by shahadmufleh on 20/04/2022.
//
//

import Foundation
import CoreData
extension Reminders {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminders> {
        return NSFetchRequest<Reminders>(entityName: "Reminders")
    }

    @NSManaged public var typeOf: [Reminder]?
    @NSManaged public var reminders: NSSet?

}

// MARK: Generated accessors for reminders
extension Reminders {

    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminder)

    @objc(removeRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: Reminder)

    @objc(addReminders:)
    @NSManaged public func addToReminders(_ values: NSSet)

    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ values: NSSet)

}

extension Reminders : Identifiable {

}
