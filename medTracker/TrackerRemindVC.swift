//
//  TrackerRemindVC.swift
//  medTracker
//
//  Created by Angel on 6/29/16.
//  Copyright © 2016 Angel Jimenez. All rights reserved.
//

import UIKit

class TrackerRemindVC: UIViewController {

    @IBOutlet weak var switchMorning: UISwitch!
    @IBOutlet weak var switchAfternoon: UISwitch!
    @IBOutlet weak var switchEvening: UISwitch!
    @IBOutlet weak var switchBedtime: UISwitch!
    @IBOutlet weak var xMorning: UILabel!
    @IBOutlet weak var xAfternoon: UILabel!
    @IBOutlet weak var xEvening: UILabel!
    @IBOutlet weak var xBedtime: UILabel!
    
    @IBOutlet weak var switchReminderMorning: UISwitch!
    @IBOutlet weak var switchReminderAfternoon: UISwitch!
    @IBOutlet weak var switchReminderEvening: UISwitch!
    @IBOutlet weak var switchReminderBedtime: UISwitch!
    @IBOutlet weak var xReminderMorning: UILabel!
    @IBOutlet weak var xReminderAfternoon: UILabel!
    @IBOutlet weak var xReminderEvening: UILabel!
    @IBOutlet weak var xReminderBedtime: UILabel!
    
    var storedDate = ""
    var currentDate = ""
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getDate() -> String {
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .NoStyle)
        print(date)
        return date
    }
    
    @IBAction func morningSwitchTapped(sender: UISwitch) {
        
        
        
    }
    
    @IBAction func afternoonSwitchTapped(sender: UISwitch) {
        
        
        
    }
    
    @IBAction func eveningSwitchTapped(sender: UISwitch) {
        
        
        
    }
    
    @IBAction func bedtimeSwitchTapped(sender: UISwitch) {
        
        
        
    }
    
    var morningNotification = UILocalNotification()
    @IBAction func morningReminderTapped(sender: UISwitch) {
        
        
        
    }
    
    var afternoonNotification = UILocalNotification()
    @IBAction func afternoonReminderTapped(sender: UISwitch) {
        
        
        
    }
    
    var eveningNotification = UILocalNotification()
    @IBAction func eveningReminderTapped(sender: UISwitch) {
        
        
        
    }
    
    var bedtimeNotification = UILocalNotification()
    @IBAction func bedtimeReminderTapped(sender: UISwitch) {
        
        
        
    }
  
    
}














