//
//  TaskListView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct NoteListView: View {
    
    // UI
    @State private var isNavigateToNewTaskView = false
    @State private var isShowLogoutAlert = false
    @State private var selectedTab = 0
    
    // Variables
    @AppStorage(Constants.Keys.userCredentials) private var userCredentials = ""
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = NoteListViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                if viewModel.getNotesList().isEmpty {
                    PlaceholderView(
                        image: "questionmark.folder.fill",
                        title: "you don't have notes, create some first"
                    )
                }else{
                    TabView(selection: $selectedTab) {
                        ListNoteView(noteList: viewModel.getNotesList()).tabItem {
                            Image(systemName: "rectangle.grid.1x2")
                            Text("List")
                        }.tag(0)
                        
                        MapNoteView(noteList: viewModel.getNotesList()).tabItem {
                            Image(systemName: "square.grid.2x2")
                            Text("Map")
                        }
                        .tag(1)
                    }
                }
            }
            
            FabView(){ isNavigateToNewTaskView = true }
                .padding(.bottom, 25)
        }
        .navigationTitle("Notes")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationBarItem(image: "lock"){ isShowLogoutAlert = true })
        .alert(isPresented: $isShowLogoutAlert){
            initAlert("Are you sure you want to logout?"){
                viewModel.logout()
                userCredentials = ""
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationDestination(
            isPresented: $isNavigateToNewTaskView,
            destination: { NewNoteView() }
        )
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
