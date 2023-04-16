//
//  ViewExtensions.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

extension View{
    func initAlert(
        _ title: String = "",
        _ message: String = "",
        _ completion: (() -> Void)? = nil
    ) -> Alert {
        if completion == nil {
            // Shows notification alert
            return Alert(
                title: Text(title),
                message: Text(message),
                dismissButton: .default(Text("Confirm"))
            )
        }else {
            // Shows alert with action
            return Alert(
                title: Text(title),
                primaryButton: .destructive(Text("Confirm"), action: completion),
                secondaryButton: .cancel())
        }
    }
}
