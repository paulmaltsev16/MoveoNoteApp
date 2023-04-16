//
//  RegistrationViewModel.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation
import FirebaseAuth

final class RegistrationViewModel{
    func signUp(
        email: String,
        password: String,
        completion: @escaping (RemoteResponse) -> Void
    ){
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) { authResult, error in
            let response = RemoteResponse(
                isSucceed: error != nil,
                message: error?.localizedDescription ?? "Something went wrong, please try again"
            )
            completion(response)
        }
    }
}

