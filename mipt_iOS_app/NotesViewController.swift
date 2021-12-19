//
//  ViewController.swift
//  secondLesson
//
//  Created by ms30 on 12.11.21.
//

import UIKit
extension NotesViewController: DataControllerDelegate {

}
    

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notesTable: UITableView!
    @IBOutlet weak var noNotes: UILabel!
    
    
    var notes = [Note]()
    let dataController = DataController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataController.delegate = self
        dataController.getNotes()
        // Do any additional setup after loading the view.
    }

//
    @IBAction func composeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "EditNoteSogue", sender: nil)
    }
    
    func deleteNoteAt(index: Int) {
        notes.remove(at: index)
        
    }
    
//    func addNote() {
//        let note = "note \(notes.count + 1)"
//
//        notes.append(note)
//        notesTable.reloadData()
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notesCount = notes.count
        if notesCount > 0 {
             noNotes.isHidden = true
         } else {
             noNotes.isHidden = false
         }
             return notesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {	
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")! as UITableViewCell
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditNoteSogue", sender: indexPath.row)

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteNoteAt(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func dataSourceChanged(dataSource: [Note]?, error:Error?) {
        if let notes = dataSource {
            self.notes = notes
            notesTable.reloadData()
     
   }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let composeVC = segue.destination as? ComposeNoteViewController {
            composeVC.dataController = dataController
            if segue.identifier == "EditNoteSegue" {
                if let index = sender as? Int {
                    composeVC.note = notes[index]
                
            }
        }
    }
}
}

        

