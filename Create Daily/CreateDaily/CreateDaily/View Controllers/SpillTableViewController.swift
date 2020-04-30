//
//  SpillTableViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class SpillTableViewController: UITableViewController {
    
    var notes: [Notes] = []
    
    //MARK: - OUTLETS
    @IBOutlet weak var noteTitleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpillCell", for: indexPath) as? SpillTableViewCell else { return UITableViewCell() }
        
        let spillCell = notes[indexPath.row]
        
        cell.titleLabel.text = spillCell.noteTitle
        cell.subtitleLabel.text = spillCell.noteDescription
        
        return cell
    }
    
    //MARK: - Segue from + to Create VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateNoteSegue" {
            if let newNoteVC = segue.destination as? CreateNoteViewController {
            newNoteVC.delegate = self
            }
        } else if segue.identifier == "NoteDetailSegue" {
            let indexPath = sender as? Int ?? 0
            let note = notes[indexPath]
            let detailVC = segue.destination as? DetailViewController
            detailVC?.noteTitle = note.noteTitle
            detailVC?.subtitle = note.noteDescription ?? ""
        }
    }
    //MARK: - Clicking on cell to Detail VC
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NoteDetailSegue", sender: indexPath.row)
    }
    
}

//MARK: - EXTENSION
extension SpillTableViewController: NewNoteDelegate {
    func noteWasCreated(_ note: Notes) {
        notes.append(note)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}



