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
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            ButtonBack(mode: mode)
                .padding(.top, 60)
                
            
            MyHeader(text: "Recuperar contraseña")
            
            textFieldsView
            
            Text("You will receive an email with your new password")
                .foregroundColor(Color("OurBlue"))
                .frame(width: 270)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            buttonView
            
        }
        .padding()
        .background(Color.white)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
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
    
    var buttonView: some View{
        Button {
            // TODO: - Login Action
        } label: {
            Text("Enviar")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
                .padding(.bottom, 70)
                .padding(.horizontal, 100)
            
        }
    }
}

struct ForgottenPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgottenPassView()
    }
}

