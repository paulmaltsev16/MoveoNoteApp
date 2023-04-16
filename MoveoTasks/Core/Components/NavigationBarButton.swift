//
//  NavigationBarButton.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct NavigationBarItem: View {
    
    @Environment(\.colorScheme) private var colorSchema
    private let image: String
    private let action: () -> Void
    
    init(image: String, _ action: @escaping () -> Void) {
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            Image(systemName: image)
                .foregroundColor(colorSchema == .dark ? .white : .black)
        }
    }
}

struct NavigationBarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarItem(image: "heart.fill"){}
    }
}
