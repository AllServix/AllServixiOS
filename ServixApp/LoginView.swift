//
//  ContentView.swift
//  AgendaSwiftUI
//
//  Created by Apps2T on 10/1/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var showRegister: Bool = false
    @State var showHome:Bool = false
    
    @State var emailFocused = false
    @State var passwordFocused = false
    
    @FocusState private var isUsernameFocused: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                
                MyHeader(text: "Inicio sesión")
                
                textFieldsView
                
                forgottenView
                
                buttonView
                
                withoutAcc
                
            }
            .padding()
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
    
    var textFieldsView: some View {
        VStack(spacing: 12) {
            TextFieldCustomView(placeholder: "Email", image: "envelope", imageSize: CGSize(width: 23, height: 17), text: $email, isFocused: $emailFocused)
            
            TextFieldCustomView(placeholder: "Password", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $password, isFocused: $passwordFocused)
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
    
    var forgottenView: some View{
        NavigationLink{
            ForgottenPassView()
        }label: {
            Text("Have you forgot your password?")
                .foregroundColor(Color("OurPurple").opacity(0.7))
                .font(.system(size: 12, weight: .bold))
                .padding(.bottom, 20)
                .padding(.top, 10)
                .padding(.leading, 180)
        }
    }
    
    var buttonView: some View{
        Button {
            login(email: email, password: password)
        } label: {
            Text("Log-In")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
                .padding(.bottom, 50)
                .padding(.horizontal, 100)
            
        }.background(
            NavigationLink(destination: HomeView(), isActive: $showHome) {
                EmptyView()
            })
    }
    
    var withoutAcc: some View{
        HStack{
            Text("You don´t have an account?")
                .foregroundColor(Color("OurBlue").opacity(0.7))
                .font(.system(size: 15, weight: .bold))
                .padding(.bottom, 30)
            
            NavigationLink{
                RegisterView()
            }label: {
                Text("Sign Up")
                    .foregroundColor(Color("OurPurple").opacity(0.7))
                    .font(.system(size: 15, weight: .bold))
                    .padding(.bottom, 30)
            }
        }
    }
    
    func login(email: String, password: String){
        
        let dictionary: [String: Any] = [
            "email" : email,
            "password" : password
        ]
        NetworkHelper.shared.requestProvider(url: "http://127.0.0.1:8000/api/users/login", params: dictionary) { data, response, error in
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
    
    //func loginFake(email: String, password: String){
        
    //    let userLoging: [String: Any] = [
    //        "email" : email,
    //        "password" : password
    //    ]
    //}
    
    func onSuccess(){
        showHome = true
    }
    
    func onError(error: String){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


