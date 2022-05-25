//
//  Reminder+CoreDataProperties.swift
//  BeFine
//
//  Created by shahadmufleh on 20/04/2022.
//
//

import Foundation
import CoreData
extension Reminder {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var date: Date?
    @NSManaged public var dose: String?
    @NSManaged public var frequency: String?
    @NSManaged public var name: String?
    @NSManaged public var time: String?
    @NSManaged public var image: String?
    @NSManaged public var reminder: NSSet?

}

// MARK: Generated accessors for reminder
extension Reminder {

    @objc(addReminderObject:)
    @NSManaged public func addToReminder(_ value: Reminders)

    @objc(removeReminderObject:)
    @NSManaged public func removeFromReminder(_ value: Reminders)

    @objc(addReminder:)
    @NSManaged public func addToReminder(_ values: NSSet)

    @objc(removeReminder:)
    @NSManaged public func removeFromReminder(_ values: NSSet)

}

extension Reminder : Identifiable {

}
