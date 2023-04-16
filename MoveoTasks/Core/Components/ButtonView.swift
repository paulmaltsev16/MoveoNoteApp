//
//  ButtonView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct ButtonView: View {
    
    private let title: String
    private let action: () -> Void
    
    init(_ title: String, _ action: @escaping () -> Void) {
        self.action = action
        self.title = title
    }
    
    var body: some View {
        Button(action: action){
            Text(title)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: Constants.Ui.buttonHeight
                )
                .font(Font.subheadline.weight(.bold))
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(Constants.Ui.cornerRadius)
        }
        .lineLimit(1)
        .multilineTextAlignment(.center)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView("Confirm", {})
    }
}
