//
//  CreateNoteViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit
//MARK: - PROTOCOL
protocol NewNoteDelegate {
    func noteWasCreated(_ note: Notes)
}

class CreateNoteViewController: UIViewController {
    var delegate: NewNoteDelegate?
    
    //MARK: - OUTLETS & ACTIONS
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - NOTIFICATION OF SAVE BUTTON TAPPED
    @IBAction func saveNoteTapped(_ sender: Any) {
        guard let noteTitle = noteTitleTextField.text,
            let noteDescription = noteTextView.text else { return }
        delegate?.noteWasCreated(Notes(noteTitle: noteTitle, noteDescription: noteDescription))
        let alert = UIAlertController(title: "Note Created!", message: "Your note entry is signed sealed & saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Finished", style: .default){
            (UIAlertAction) -> Void in
            self.navigationController?.popToRootViewController(animated: true)
        })
    present(alert, animated: true, completion: nil)
}
    
    @IBAction func noteReminderTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateNoteSegue" {
            let newNoteVC = segue.destination as? SpillTableViewController
            //finish
        }
    }
}

