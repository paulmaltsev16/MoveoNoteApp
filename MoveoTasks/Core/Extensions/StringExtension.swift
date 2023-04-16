//
//  StringExtension.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        guard let firstChar = self.first else {
            // Return empty string if input is empty
            return ""
        }
        
        let uppercaseFirstChar = String(firstChar).capitalized
        let remainingChars = self.dropFirst()
        return uppercaseFirstChar + remainingChars
    }
}
