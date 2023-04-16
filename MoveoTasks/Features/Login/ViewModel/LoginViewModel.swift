//
//  LoginViewModel.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation
import FirebaseAuth

final class LoginViewModel {
    
    func login(email: String, password: String, completion: @escaping (RemoteResponse) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){ authDataResult, authError in
            let response = RemoteResponse(
                isSucceed: authError == nil,
                message: authError?.localizedDescription ?? ""
            )
            
            completion(response)
        }
    }
}
