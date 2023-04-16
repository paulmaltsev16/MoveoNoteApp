//
//  ForgotPasswordView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    
    @State private var responseMessage: String = ""
    @State private var isResetingInProcess = false
    @State private var isShowAlert = false
    @State private var emailInput = ""
    
    var body: some View {
        VStack{
            Text("Please provide your email to reset password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, Constants.Ui.paddingBetweenView)
            
            TextField("Please enter email", text: $emailInput)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.emailAddress)
                .padding(.bottom, Constants.Ui.paddingBetweenView)
            
            if isResetingInProcess {
                ProgressView().frame(maxHeight: Constants.Ui.buttonHeight)
            }else{
                ButtonView("Reset password", resetPassword)
            }
            
            Spacer()
        }
        .padding(.all, Constants.Ui.edgePadding)
        .navigationTitle("Reset password")
        .alert(
            isPresented: $isShowAlert,
            content: { initAlert(responseMessage) }
        )
    }
    
    private func resetPassword(){
        isResetingInProcess = true
        Auth.auth().sendPasswordReset(withEmail: emailInput){error in
            isResetingInProcess = false
            responseMessage = error?.localizedDescription ?? "Check your email to reset password"
            isShowAlert = true
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
