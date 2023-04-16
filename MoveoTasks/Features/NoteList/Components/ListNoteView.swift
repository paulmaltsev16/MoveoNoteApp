//
//  ListNoteView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 15/04/2023.
//

import SwiftUI

struct ListNoteView: View {
    
    let noteList: [Note]
    
    var body: some View {
        List(noteList){ note in
            ListNoteItemView(note: note)
        }
    }
}

struct ListNoteItemView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    private let note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        NavigationLink(destination: NewNoteView(note: note)){
            HStack{
                VStack{
                    Text(note.getTitle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 1)
                        .lineLimit(1)
                    
                    Text(note.getBody())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                Spacer()
                Text("\(note.getDateTitle())")
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .frame(minHeight: 50)
    }
}

struct ListNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ListNoteView(noteList: [])
    }
}
