//
//  NewTaskView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct NewNoteView: View {
    
    // Ui
    @State private var titleInput = ""
    @State private var bodyInput = ""
    @State private var dateInput = Date()
    @State private var isShowAlert = false
    
    // Variables
    @Environment(\.presentationMode) private var presentationMode
    private let viewModel: NewNoteViewModel
    
    init(){
        self.viewModel = NewNoteViewModel()
    }
    
    init(note: Note){
        self.viewModel = NewNoteViewModel(note: note)
    }
    
    var body: some View {
        VStack{
            DatePicker(
                "Select a date:",
                selection: $dateInput,
                displayedComponents: [.date]
            ).padding(.bottom, Constants.Ui.paddingBetweenView)
            
            
            Text("Please enter title")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Title", text: $titleInput)
                .padding(.bottom, Constants.Ui.paddingBetweenView)
                .disableAutocorrection(true)
            
            Text("Please add description")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextEditor(text: $bodyInput)
                .padding(.bottom, Constants.Ui.paddingBetweenView)
                .border(Color.gray, width: 0.2)
            
            Spacer()
            
            ButtonView("Save", {
                viewModel.saveNote(date: dateInput, title: titleInput, body: bodyInput)
                presentationMode.wrappedValue.dismiss()
            })
        }
        .navigationTitle("New note")
        .navigationBarItems(trailing: NavigationBarItem(image: "xmark.bin", {
            isShowAlert = true
        }))
        .padding(.all, Constants.Ui.edgePadding)
        .onAppear{
            setDataFromCurrentNote()
        }
        .alert(isPresented: $isShowAlert){
            initAlert("Delete this note?"){
                viewModel.removeNote()
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    private func setDataFromCurrentNote(){
        if let title = viewModel.getNote()?.getTitle(),
           let body = viewModel.getNote()?.getBody(),
           let date = viewModel.getNote()?.getDate()
        {
            self.titleInput = title
            self.bodyInput = body
            self.dateInput = date
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
