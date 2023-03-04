//
//  ForgottenPassView.swift
//  ServixApp
//
//  Created by Apps2T on 16/2/23.
//

import SwiftUI

struct ForgottenPassView: View {
    
    @State var email: String = ""
    @State var emailFocused = false
    @State var showLogin:Bool = false
    
    var body: some View {
        VStack {
            
            ButtonBack(showLogin: $showLogin)
                .padding(.top, 60)
            
            headerView
            
            textFieldsView
            
            Text("You will receive an email with your new password")
                .foregroundColor(Color("OurBlue"))
                .frame(width: 270)
                .multilineTextAlignment(.center)
            
            Spacer() 
            
        }
        .padding()
        .background(Color.white)
        .ignoresSafeArea()
    }
    var textFieldsView: some View {
        VStack(spacing: 12) {
            TextFieldCustomView(placeholder: "Email", image: "envelope", imageSize: CGSize(width: 23, height: 17), text: $email, isFocused: $emailFocused)
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
    var headerView: some View {
        VStack(spacing: 15) {
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 130)
            
            Text("Log-In")
                .foregroundColor(Color("OurBlue"))
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 30)
            
        }
    }
}

struct ForgottenPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgottenPassView()
    }
}

