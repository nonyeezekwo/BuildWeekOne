//
//  CreateNoteViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

protocol NewNoteDelegate {
    func noteWasCreated(note: Notes)
}

class CreateNoteViewController: UIViewController {
    
    var delegate: NewNoteDelegate?

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNoteTapped(_ sender: Any) {
        guard let noteTitle = noteTitleTextField.text,
         let noteDescription = noteTextView.text else { return }
        
        
        var notes: [String] = []
      
        if let note = noteTitleTextField.text,
            note != "" {
            notes.append(note)
    }
        
    let newNotes = Notes(noteTitle: noteTitle, noteDescription: noteDescription)
        delegate?.noteWasCreated(note: newNotes)
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func noteReminderTapped(_ sender: Any) {
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

