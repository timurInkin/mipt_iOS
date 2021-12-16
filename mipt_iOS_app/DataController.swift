//
//  DataController.swift
//  mipt_iOS_app
//
//  Created by ms30 on 16.12.21.
//

import Foundation
//import QuartzCore
enum NoteModificationTask {
    case create
    case edit
    case delete
}

protocol DataControllerDelegate {
    func dataSourceChanged(dataSource:[Note]?, error:Error?)
}
class DataController {
    var notes:[Note]?
    var delegate:DataControllerDelegate?
    
    func getNotes() {
        self.delegate?.dataSourceChanged(dataSource: self.notes, error: nil)
    }
    func modify(note:Note, task:NoteModificationTask) {
        if var notes = self.notes {
            switch task {
            case .create:
                notes.append(note)
                break
            case .edit:
                if let index = notes.index(where: {$0 == note}) {
                    notes[index] = note
                }
                break
            case .delete:
                if let index = notes.index(where: {$0 == note}) {
                    notes.remove(at: index)
                }
                break
            }
            self.notes = notes
            self.delegate?.dataSourceChanged(dataSource: self.notes, error: nil)
        }
    }
}
