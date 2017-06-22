//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Quang Vu on 6/21/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    // Create a new note object which will also insert it into the managed context which is a pool of contents inside Core Data
    static func newNote() -> Note{
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    // Save the note to Core Data
    static func saveNote(){
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    // Delete note from Core Data
    static func deleteNote(note: Note){
        managedContext.delete(note)
        saveNote()
    }
    
    // Retrieve note from Core Data
    static func retrieveNote() -> [Note] {
        // Create a fetch request - which type of object we want and from wat entity
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}
