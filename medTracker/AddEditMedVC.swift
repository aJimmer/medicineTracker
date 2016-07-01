//
//  AddEditMedVC.swift
//  medTracker
//
//  Created by Angel on 6/29/16.
//  Copyright © 2016 Angel Jimenez. All rights reserved.
//

import UIKit
import CoreData

class AddEditMedVC: UIViewController, UITextFieldDelegate {

    var newMed : Medicine? = nil
    var timeToTake = "Morning"
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medDosage: UITextField!
    @IBOutlet weak var medTime: UISegmentedControl!
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if newMed != nil {
            medName.text = newMed!.name
            medDosage.text = newMed!.dosage
            timeToTake = newMed!.time!
            
            if timeToTake == "Morning" {
                medTime.selectedSegmentIndex = 0
            } else if timeToTake == "Afternoon" {
                medTime.selectedSegmentIndex = 1
            } else if timeToTake == "Evening" {
                medTime.selectedSegmentIndex = 2
            }else if timeToTake == "Bedtime" {
                medTime.selectedSegmentIndex = 3
            }
            
        }
        medName.delegate = self
        medDosage.delegate = self
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        medName.resignFirstResponder()
        medDosage.resignFirstResponder()
        
        return true
    }
    
    func dismissVC(){
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func timeSelectorDidChange(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            timeToTake = "Morning"
        case 1:
            timeToTake = "Afternoon"
        case 2:
            timeToTake = "Evening"
        case 3:
            timeToTake = "Bedtime"
        default:
            break
        }
        
    }

    @IBAction func saveTapped(sender: AnyObject) {
        
        if newMed == nil {
            addMed()
        } else {
            editMed()
        }
        
        dismissVC()
    }

    func addMed() {
        
        let entity = NSEntityDescription.entityForName("Medicine", inManagedObjectContext: moc)
        
        let newMed = Medicine(entity: entity!, insertIntoManagedObjectContext: moc)
        
        newMed.name = medName.text
        newMed.dosage = medDosage.text
        newMed.time = timeToTake
        
        do {
            try moc.save()
        } catch {
            return
        }
    }
    
    func editMed() {
        
        newMed?.name = medName.text!
        newMed?.dosage = medDosage.text!
        
        switch medTime {
        case "Morning":
            medTime.selectedSegmentIndex = 0
        case "Afternoon":
            medTime.selectedSegmentIndex = 1
        case "Evening":
            medTime.selectedSegmentIndex = 2
        case "Bedtime":
            medTime.selectedSegmentIndex = 3
        default:
            break;
        }
        
        newMed?.time = timeToTake
        
        do {
            try moc.save()
        } catch {
            return
        }
        
    }
}
