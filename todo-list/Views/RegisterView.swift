//
//  RegisterView.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: .orange)
        
        Form {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Create Account", background: .green) {
                viewModel.register()
            }
        }
        
        .offset(y: -50)
        Spacer()
    }
}

#Preview {
    RegisterView()
}
