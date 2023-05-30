//
//  RegisterView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @FocusState var userNameFieldFocused: Bool
    @FocusState var passwordFieldFocused: Bool
    @State var isSecured: Bool = true
    
    var body: some View {
        
        VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $userManager.profile.userName)
                .focused($userNameFieldFocused)
                .submitLabel(.done)
                .onSubmit(changeFocusToPassword)
                .bordered()
            
            HStack {
                Spacer()
                
                Text("\(userManager.profile.userName.count)")
                    .font(.caption)
                    .foregroundColor(
                        userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
            }
            
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField("Type your password...", text: $userManager.profile.password)
                            .focused($passwordFieldFocused)
                            .submitLabel(.done)
                            .onSubmit(registerUser)
                            .bordered()
                    } else {
                        TextField("Type your password...", text: $userManager.profile.password)
                            .focused($passwordFieldFocused)
                            .submitLabel(.done)
                            .onSubmit(registerUser)
                            .bordered()
                    }
                }.padding(.trailing, 32)

                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
            }
            
            HStack {
                Spacer()
                
                Text("\(userManager.profile.password.count)")
                    .font(.caption)
                    .foregroundColor(
                        userManager.isPasswordValid() ? .green : .red)
                    .padding(.trailing)
            }
            
            HStack {
                Spacer()
                
                Toggle(isOn: $userManager.settings.rememberUser) {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .fixedSize()
            }
            .padding(.bottom)
            
            Button(action: self.registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
                .foregroundColor(.red)
            }
            .bordered()
            .disabled(!userManager.isUserNameValid())

            Spacer()
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

// MARK: - Event Handlers
extension RegisterView {
    func registerUser() {
        userNameFieldFocused = false
        
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }
        
        userManager.persistSettings()
        userManager.setRegistered()
    }
    
    func changeFocusToPassword() {
        userNameFieldFocused = false
        passwordFieldFocused = true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(userName: "Irakli", password: "Password")
    
    static var previews: some View {
        RegisterView()
            .environmentObject(user)
    }
}
