//
//  MapNoteView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 15/04/2023.
//

import SwiftUI

struct MapNoteView: View {
    
    let noteList: [Note]
    
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 190)) ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: adaptiveColumns, spacing: 20
            ) {
                ForEach(noteList){ note in
                    MapNoteItemView(note: note)
                }
            }
        }
    }
}

struct MapNoteItemView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    private let note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        NavigationLink(destination: NewNoteView(note: note)){
            VStack{
                Text(note.getTitle())
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .frame(alignment: .leading)
                    .font(.system(size: 17, weight: .bold))
                    .lineLimit(1)
                
                Text(note.getBody())
                    .font(.system(size: 15))
                    .frame(alignment: .leading)
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
                    .lineLimit(1)
                
                Text("\(note.getDateTitle())")
                    .frame(alignment: .leading)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }.padding()
        }
        .border(.gray)        
    }
}

struct MapNoteView_Previews: PreviewProvider {
    static var previews: some View {
        MapNoteView(noteList: [])
    }
}
