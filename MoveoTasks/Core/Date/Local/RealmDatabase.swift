//
//  Database.swift
//  MoveoTasks
//
//  Class creates Realm instance to store notes for different users according to firebase id.
//
//  Created by Paul Maltsev on 15/04/2023.
//

import Foundation
import RealmSwift
import FirebaseAuth

class RealmDatabase{
    
    private static var instance: Realm?
    private static var currentUserId: String?
    
    static func getInstance() -> Realm? {
        let firebaseUserId = Auth.auth().currentUser?.uid ?? ""
        
        // If instance not null and belongs to current user returns this instance
        if let instance = instance, currentUserId == firebaseUserId {
            return instance
        }else{
            currentUserId = firebaseUserId
        }
        
        let databaseUrl = Realm.Configuration()
            .fileURL?
            .deletingLastPathComponent()
            .appendingPathComponent("\(firebaseUserId).realm")
        
        
        do{
            let config = Realm.Configuration.init(fileURL: databaseUrl)
            return try Realm(configuration: config)
        }catch{
            return nil
        }
    }
}
