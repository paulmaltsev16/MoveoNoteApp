//
//  Note.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation
import RealmSwift

class Note: Object, Identifiable{
    
    @objc dynamic var _id = UUID().uuidString
    @objc dynamic private var date: Date?
    @objc dynamic private var title: String?
    @objc dynamic private var body: String?
    
    override init() {
        super.init()
    }
    
    init(date: Date, title: String, body: String) {
        self.date = date
        self.title = title
        self.body = body
    }
    
    func getDate() -> Date {
        return date ?? Date()
    }
    
    func getDateTitle() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        return dateformatter.string(from: date ?? Date())
    }
    
    func getTitle() -> String {
        if let title = title, !title.isEmpty {
            return title.capitalizeFirstLetter()
        }else{
            return "Empty title"
        }
    }
    
    func getBody() -> String {
        if let body = body, !body.isEmpty {
            return body.capitalizeFirstLetter()
        }else{
            return "Empty description"
        }
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
