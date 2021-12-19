//
//  ComposeNoteViewController.swift
//  mipt_iOS_app
//
//  Created by ms30 on 16.12.21.
//

import UIKit

class ComposeNoteViewController: UIViewController {

    @IBOutlet weak var noteText: UITextView!
    public var dataController: DataController!
    public var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = self.note {
            noteText.text = note.text
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        if noteText.text.count > 0 {
            let task:NoteModificationTask
            var currentNote:Note
            if let note = self.note as? Note {
            task = .edit
                currentNote = Note(text: noteText.text, identifier: note.identifier)
            } else {
                task = .create
                currentNote = Note(text: noteText.text, identifier: "")
            }
            dataController.modify(note: currentNote, task: task)
                
            }
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
