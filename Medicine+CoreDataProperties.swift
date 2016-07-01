//
//  Medicine+CoreDataProperties.swift
//  medTracker
//
//  Created by Angel on 6/29/16.
//  Copyright © 2016 Angel Jimenez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Medicine {

    @NSManaged var name: String?
    @NSManaged var dosage: String?
    @NSManaged var time: String?

}
