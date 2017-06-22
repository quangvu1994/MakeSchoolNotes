//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextField: UITextView!
    
    // Initialize both title and content to be empty
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let currentNote = note {
            noteTitleTextField.text = currentNote.title
            noteContentTextField.text = currentNote.content
        }else{
            noteTitleTextField.text = ""
            noteContentTextField.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                let currentNote = note ?? CoreDataHelper.newNote()
                currentNote.title = noteTitleTextField.text
                currentNote.content = noteContentTextField.text
                currentNote.modificationDate = Date() as NSDate
                CoreDataHelper.saveNote()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
