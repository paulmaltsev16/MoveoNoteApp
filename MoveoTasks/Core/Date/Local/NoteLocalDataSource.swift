//
//  LocalDataSource.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation
import RealmSwift
import Realm

class NoteLocalDataSource{
    
    private static var realm: Realm? {
        return RealmDatabase.getInstance()
    }
    
    class func save(note: Note){
        do{
            try realm?.write{
                realm?.add(note, update: .all)
            }
        }catch{
            print("NoteLocalDataSource, save() exception: \(error.localizedDescription).")
        }
    }
    
    class func readAll() -> [Note]{
        if let result = realm?.objects(Note.self){
            return Array(result)
        }else{
            return []
        }
    }
    
    class func delete(note: Note){
        do{
            try realm?.write {
                realm?.delete(note)
            }
        }catch{
            print("NoteLocalDataSource, delete() exception: \(error.localizedDescription).")
        }
    }
}
