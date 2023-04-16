//
//  UserCredentials.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation

struct UserCredentials: Codable {
    
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func toJson() -> String {
        do{
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8) ?? ""
        }catch{
            print("UserCredentials, toJson() encoding failed: \(error.localizedDescription)")
            return ""
        }
    }
    
    static func fromJson(_ json: String?) -> UserCredentials {
        guard let json = json else{
            return UserCredentials(email: "", password: "")
        }
        
        do{
            let data = json.data(using: .utf8) ?? Data()
            return try JSONDecoder().decode(UserCredentials.self, from: data)
        }catch{
            print("UserCredentials, fromJson() decoding failed: \(error.localizedDescription)")
            return UserCredentials(email: "", password: "")
        }
    }
}
