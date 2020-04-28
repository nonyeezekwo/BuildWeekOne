//
//  SpillTableViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class SpillTableViewController: UITableViewController {
    //MARK: - OUTLETS
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var notes: [Notes] = [Notes(noteTitle: "First Day of Summer", noteDescription: "The beginning of summer has been absolutely magical, cant wait until I am able to get to the beach")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self


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
        
        
        

        
        //cell.movieLabel.text = spillCell.noteTitle
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


//     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CreateNoteSegue" {
            let newNoteVC = segue.destination as? CreateNoteViewController
            newNoteVC?.delegate = self
    
        }
    }
}

    extension SpillTableViewController: NewNoteDelegate {
        func noteWasCreated(note: Notes) {
            notes.append(contentsOf: notes)
            tableView.reloadData()
        }
    }
    


