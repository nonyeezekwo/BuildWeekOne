//
//  ReminderViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit
protocol DatePickerDelegate {
    func reminderDateChosen(_: Date)
}


class ReminderViewController: UIViewController {

var delegate: DatePickerDelegate?
var notes: [Notes] = []
    
    @IBAction func datePickerSwiped(_ sender: Any) {
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dateSetTapped(_ sender: Any) {
        delegate?.reminderDateChosen(datePicker.date)
              dismiss(animated: true, completion: nil)
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
