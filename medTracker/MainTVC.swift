//
//  MainTVC.swift
//  medTracker
//
//  Created by Angel on 6/29/16.
//  Copyright © 2016 Angel Jimenez. All rights reserved.
//

import UIKit
import CoreData

class MainTVC: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let moc : NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    func fetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Medicine")
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
    
    func getFRC() -> NSFetchedResultsController {
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            return
        }
        
        //cell height
        self.tableView.rowHeight = 60
        
        // background
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "dark_grey"))
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = frc.sections?.count
        
        return numberOfSections!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // set alternating alphas
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clearColor()
        } else {
            
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        // Configure the cell
        
        let med = frc.objectAtIndexPath(indexPath) as! Medicine
        cell.textLabel?.text = med.name
        
        let dosage = med.dosage
        let time = med.time
        
        cell.detailTextLabel?.text = "\(dosage!)mg. at \(time!)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let managedObject : NSManagedObject = frc.objectAtIndexPath(indexPath) as! NSManagedObject
        moc.deleteObject(managedObject)
        
        do {
            try moc.save()
        } catch {
            print("Failed to save.")
            return
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "edit" {
            let cell = sender as!UITableViewCell
            
            let indexPath = tableView.indexPathForCell(cell)
            
            let medController : AddEditMedVC = segue.destinationViewController as! AddEditMedVC
            
            let newMed : Medicine = frc.objectAtIndexPath(indexPath!) as! Medicine
            
            medController.newMed = newMed
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



















