//
//  ContentView.swift
//  AgendaSwiftUI
//
//  Created by Apps2T on 10/1/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var repeatP: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var showLogin:Bool = false
    
    @State var usernameFocused = false
    @State var passwordFocused = false
    @State var repeatFocused = false
    @State var emailFocused = false
    @State var phoneFocused = false
    
    @FocusState private var isUsernameFocused: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 0) {
            
            ButtonBack(mode: mode)
            
            //Logo y texto
            MyHeader(text: "Registro")
            
            // Textfields
            textFieldsView
            
            //Botón
            buttonView
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
    
    
    // MARK: - Accessory Views
        
    var textFieldsView: some View {
        VStack(spacing: 12) {
            
            TextFieldCustomView(placeholder: "Username", image: "person.fill", imageSize: CGSize(width: 17, height: 20), text: $username, isFocused: $usernameFocused)
            
            
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
    func login(username: String, email: String, password: String, repeatPass: String, phoneNumber: String){
        
        let dictionary: [String: Any] = [
            "username": username,
            "email" : email,
            "password" : password,
            "repeatPass": repeatPass,
            "phoneNumber": phoneNumber
        ]
        NetworkHelper.shared.requestProvider(url: "https://superapi.netlify.app/api/login", params: dictionary) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                
            }else if let data = data, let response = response as? HTTPURLResponse{
                print(response.statusCode)
                print(String(bytes:data, encoding: .utf8))
                if response.statusCode == 200{
                    onSuccess()
                }else{
                    onError(error: error?.localizedDescription ?? "Request error")
                }
            }
        }
    }
    
    func onSuccess() {
        showLogin = true
    }
    
    func onError(error: String){
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
