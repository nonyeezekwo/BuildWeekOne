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
    @IBOutlet weak var noteSaveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNoteButton()
    }
    //MARK: - NOTIFICATION OF SAVE BUTTON TAPPED
    @IBAction func saveNoteTapped(_ sender: Any) {
        guard let noteTitle = noteTitleTextField.text,
            let noteDescription = noteTextView.text else { return }
        delegate?.noteWasCreated(Notes(noteTitle: noteTitle, noteDescription: noteDescription))
        let alert = UIAlertController(title: "Note Created!", message: "Your new note has been saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Finished", style: .default){
            (UIAlertAction) -> Void in
            self.navigationController?.popToRootViewController(animated: true)
        })
    present(alert, animated: true, completion: nil)
}
    func configureNoteButton() {
        noteSaveButton.layer.borderWidth = 3
        noteSaveButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        noteSaveButton.layer.cornerRadius = 20
        noteSaveButton.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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

