//
//  DetailViewController.swift
//  CreateDaily
//
//  Created by Nonye on 4/29/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var noteDetailTitle: UILabel!

    @IBOutlet weak var noteDetailSubtitle: UILabel!
    var notes: [Notes] = []
    var detailVC: [Notes] = []
    
    var noteTitle = ""
    var subtitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noteDetailTitle.text = noteTitle
        noteDetailSubtitle.text = subtitle
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
