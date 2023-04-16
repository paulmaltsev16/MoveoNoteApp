//
//  TaskListViewModel.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation
import FirebaseAuth
import RealmSwift

final class NoteListViewModel: ObservableObject{
        
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
            print("TaskListViewModel, logout() can't proceed: \(error)")
        }
    }
    
    func getNotesList() -> [Note] {
        return NoteLocalDataSource.readAll()
    }
}
