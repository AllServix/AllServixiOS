//
//  ContentView.swift
//  AgendaSwiftUI
//
//  Created by Apps2T on 10/1/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var password: String = ""
    @State var repeatP: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var showLogin:Bool = false
    
    @State var nameFocused = false
    @State var surnameFocused = false
    @State var passwordFocused = false
    @State var repeatFocused = false
    @State var emailFocused = false
    @State var phoneFocused = false
    
    @FocusState private var isUsernameFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                //Logo y texto
                headerView
                
                // Textfields
                textFieldsView
                
                //Botón
                buttonView
            }
            
        }
        .background(Color.white)
        
    }
    
    // MARK: - Accessory Views
    
    var headerView: some View {
        VStack(spacing: 15) {
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.top, 30)
            
            Text("Sign-Up")
                .foregroundColor(Color("OurBlue"))
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 30)
            
        }
    }
    
    var textFieldsView: some View {
        VStack(spacing: 12) {
            
            TextFieldCustomView(placeholder: "Name", image: "envelope", imageSize: CGSize(width: 23, height: 17), text: $name, isFocused: $nameFocused)
            
            TextFieldCustomView(placeholder: "Surname", image: "envelope", imageSize: CGSize(width: 23, height: 17), text: $surname, isFocused: $surnameFocused)
            
            TextFieldCustomView(placeholder: "Email", image: "envelope", imageSize: CGSize(width: 23, height: 17), text: $email, isFocused: $emailFocused)
            
            TextFieldCustomView(placeholder: "Password", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $password, isFocused: $passwordFocused)
            
            TextFieldCustomView(placeholder: "Repeat Password", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $repeatP, isFocused: $repeatFocused)
            
            TextFieldCustomView(placeholder: "Phone number", image: "iphone", imageSize: CGSize(width: 17, height: 25), text: $phone, isFocused: $phoneFocused)
            
            
        }
        .padding(.horizontal)
    }
    
    var buttonView: some View{
        Button {
            // TODO: - Login Action
        } label: {
            Text("Register")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(width: 180, height: 60)
            //.frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
            
        }.background(
            NavigationLink(destination: LoginView(), isActive: $showLogin) {
                EmptyView()
            })
        .padding(.top, 50)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
