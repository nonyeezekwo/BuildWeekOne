//
//  CreateModel.swift
//  CreateDaily
//
//  Created by Nonye on 4/29/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import Foundation

class CreateModel {

var notes: [Notes] = []
    
    private var createNoteURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("CreateNote.plist")
    }
   func saveToPresistentStore() {
       guard let url = createNoteURL  else { return }

       do {
           let encoder = PropertyListEncoder()
           let createNoteData = try encoder.encode(notes)
           try createNoteData.write(to: url)
       } catch {
           print("Error saving new note")
       }
   }
   func loadFromPersistentStore() {
       let fileManager = FileManager.default
       do {
           guard let url = createNoteURL, fileManager.fileExists(atPath: url.path) else { return }
           let createNoteData = try Data(contentsOf: url)
           let decoder = PropertyListDecoder()
           let decodedCreateNote = try decoder.decode([Notes].self, from: createNoteData)

       } catch {
           print("error loading new notes")
       }
   }
}
