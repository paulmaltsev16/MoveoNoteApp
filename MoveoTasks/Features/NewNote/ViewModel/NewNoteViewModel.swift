//
//  NewTaskViewModel.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation

final class NewNoteViewModel: ObservableObject{
    
    private let note: Note?
    
    // Note instance received via params, if its null program will create a new note else update it.
    init(note: Note? = nil) {
        self.note = note
    }
    
    func saveNote(date: Date, title: String, body: String){
        let note = Note(date: date, title: title, body: body)
        // If it is not null, the program will update this note in the save() method.
        if let id = self.note?._id{
            note._id = id
        }
        NoteLocalDataSource.save(note: note)
    }
    
    func removeNote(){
        if let note = note {
            NoteLocalDataSource.delete(note: note)
        }
    }
    
    func getNote() -> Note? {
        return note
    }
}
