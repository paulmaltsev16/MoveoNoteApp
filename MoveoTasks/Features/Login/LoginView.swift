//
//  LoginView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct LoginView: View {
    
    // Ui
    @State private var isNavigateToForgotPasswordView = false
    @State private var isNavigateToTaskList = false
    @State private var isLoginInProcess = false
    @State private var isShowAlert = false
    @State private var emailInput = ""
    @State private var passInput = ""
    @State private var alert: Alert?
    
    // Variables
    @AppStorage(Constants.Keys.userCredentials) private var userCredentials: String = ""
    @Environment(\.colorScheme) private var colorScheme
    private let viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                VStack(spacing: Constants.Ui.verticalSpaceBetweenViews){
                    
                    TextField("Please enter email", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textContentType(.emailAddress)
                    
                    SecureField("Please enter password", text: $passInput)
                        .keyboardType(.emailAddress)
                        .textContentType(.password)
                    
                    Button("forgot password",
                           action: { isNavigateToForgotPasswordView = true }
                    )
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 15)
                    
                    if isLoginInProcess {
                        ProgressView().frame(maxHeight: Constants.Ui.buttonHeight)
                    }else{
                        ButtonView("Login") {
                            login(email: emailInput, password: passInput)
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: RegistrationView()) {
                    Text("Sign up")
                }
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 20, weight: .bold))
            }
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
            .padding(.all, Constants.Ui.edgePadding)
            .alert(isPresented: $isShowAlert) {
                alert ?? initAlert("Can't proceed", "Please try again later")
            }
        }
        .navigationDestination(
            isPresented: $isNavigateToTaskList,
            destination: {
                NoteListView()
            }
        )
        .navigationDestination(
            isPresented: $isNavigateToForgotPasswordView,
            destination: {ForgotPasswordView()}
        )
        .onAppear{
            trySignInWithLocalCredentials()
        }
    }
    
    private func trySignInWithLocalCredentials(){
        let userCredentials = UserCredentials.fromJson(userCredentials)
        if userCredentials.email.isEmpty || userCredentials.password.isEmpty {
            return
        }
        
        login(email: userCredentials.email, password: userCredentials.password)
    }
    
    private func login(email: String, password: String){
        isLoginInProcess = true
        viewModel.login(email: email, password: password){ response in
            isLoginInProcess = false
            
            if response.isSucceed {
                // User can manually signed in, program will store credentials to future auto login
                userCredentials = UserCredentials(email: email, password: password).toJson()
                
                // Clear input after successful login
                emailInput = ""
                passInput = ""
                
                // Shows welcome alert
                isShowAlert = true
                alert = initAlert("Welcome back")
                
                isNavigateToTaskList = true
            }else{
                // Reset credentials after failure login
                userCredentials = ""
                // Notify user of failed login
                isShowAlert = true
                alert = initAlert("Can't login", response.message)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
