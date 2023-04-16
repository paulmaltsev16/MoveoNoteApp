//
//  RegistrationView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    // Ui
    @State private var isRegistrationInProcess = false
    @State private var isNavigateToTasksList = false
    @State private var isShowAlert = false
    @State private var emailInput = ""
    @State private var passInput = ""
    @State private var alert: Alert?
        
    // Variables
    @AppStorage(Constants.Keys.userCredentials) private var userCredentials = ""
    private let viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationStack{
            NavigationView{
                VStack(spacing: Constants.Ui.verticalSpaceBetweenViews){
                    
                    TextField("Please enter email", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textContentType(.emailAddress)
                    
                    SecureField("Please enter password", text: $passInput)
                        .keyboardType(.emailAddress)
                        .textContentType(.password)
                        .padding(.bottom, 15)
                    
                    if isRegistrationInProcess {
                        ProgressView().frame(maxHeight: Constants.Ui.buttonHeight)
                    }else{
                        ButtonView("Sign up", signUp)
                    }
                }
            }
            .accentColor(.black)
            .navigationTitle("Sign up")
            .padding(.all, Constants.Ui.edgePadding)
            .alert(isPresented: $isShowAlert) {
                alert ?? initAlert("Can't proceed", "Please try again later")
            }
        }.navigationDestination(
            isPresented: $isNavigateToTasksList,
            destination: { NoteListView() }
        )
    }
    
    private func signUp(){
        isRegistrationInProcess = true
        viewModel.signUp(email: emailInput, password: passInput){ response in
            isRegistrationInProcess = false
            
            if response.isSucceed {
                // Store user credentials locally for auto login
                userCredentials = UserCredentials(email: emailInput, password: passInput).toJson()
                isNavigateToTasksList = true
            }else{
                alert = initAlert("Can't proceed", response.message)
                isShowAlert = true
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

