//
//  PlaceholderView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 15/04/2023.
//

import SwiftUI

struct PlaceholderView: View {
    let image: String
    let title: String
    
    var body: some View {
        Image(systemName: image)
            .resizable()
            .frame(width: 50, height: 40)
            .aspectRatio(contentMode: .fit)
            .padding(.bottom, Constants.Ui.paddingBetweenView)
            .foregroundColor(Color.accentColor)
        
        Text(title)
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(image: "questionmark.folder.fill", title: "title")
    }
}
