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
    
    @State var nameFocused = false
    @State var passwordFocused = false
    
    @FocusState private var isUsernameFocused: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.top, 70)
                
                Text("Log-In")
                    .foregroundColor(Color("OurBlue"))
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 15)
                    .padding(.bottom, 70)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(nameFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                            .offset(y: nameFocused ? 0 : 6)
                            .scaleEffect(nameFocused ? 1.5 : 1.2)
                        
                        TextField("", text: $email
                                  , onEditingChanged: { edited in
                            if edited {
                                withAnimation(.easeIn){
                                    nameFocused = true
                                }
                            } else {
                                if email == "" {
                                    withAnimation(.easeOut){
                                        nameFocused = false
                                    }
                                }
                            }
                            
                        })
                        .disableAutocorrection(true)
                    }
                    .padding(.top, nameFocused ? 15 : 0)
                    .background(
                        
                        Text("Email")
                            .padding(.leading, 30)
                            .scaleEffect(nameFocused ? 0.8 : 1)
                            .offset(x: nameFocused ? -1 : 0, y: nameFocused ? -18 : 8 )
                            .foregroundColor(nameFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                        ,alignment: .leading
                        
                    ).padding(.horizontal)
                    
                    
                    Rectangle()
                        .fill(nameFocused ? Color("OurBlue") : Color("OurBlue").opacity(0.7))
                        .opacity(nameFocused ? 1 : 0.7)
                        .frame(height : 5)
                        .padding(.top, 20)
                })
                .padding(.top, 12)
                .background(Color("OurBlue").opacity(0.22))
                .cornerRadius(5)
                .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    HStack(spacing: 15){
                        
                        Image("PassIcon70")
                            .foregroundColor(passwordFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                            .offset(y: passwordFocused ? -1 : 0)
                        
                        TextField("", text: $password, onEditingChanged: { edited in
                            if edited {
                                withAnimation(.easeIn){
                                    passwordFocused = true
                                }
                            } else {
                                if password == "" {
                                    withAnimation(.easeOut){
                                        passwordFocused = false
                                    }
                                }
                            }
                        })
                        .disableAutocorrection(true)
                    }
                    .padding(.top, passwordFocused ? 15 : 0)
                    .background(
                        
                        Text("Password")
                            .padding(.leading, 30)
                            .scaleEffect(passwordFocused ? 0.8 : 1)
                            .offset(x: passwordFocused ? -1 : 0, y: passwordFocused ? -18 : 0 )
                            .foregroundColor(passwordFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                        ,alignment: .leading
                    ).padding(.horizontal)
                    
                    Rectangle()
                        .fill(passwordFocused ? Color("OurBlue") : Color("OurBlue").opacity(0.7))
                        .opacity(passwordFocused ? 1 : 0.7)
                        .frame(height : 5)
                        .padding(.top, 10)
                })
                .padding(.top, 12)
                .background(Color("OurBlue").opacity(0.22))
                .cornerRadius(5)
                
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
                
                Spacer()
                
                Button {
                    // TODO: - Login Action
                } label: {
                    Text("Log-In")
                        .foregroundColor(.white)
                        .font(.system(size: 27))
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("OurBlue"))
                        .cornerRadius(15)
                        .padding(.bottom, 80)
                        .padding(.horizontal, 100)
                    
                }.background(
                    NavigationLink(destination: RegisterView(), isActive: $showHome) {
                        EmptyView()
                    })
                
                HStack{
                    
                    Text("You don´t have an account?")
                        .foregroundColor(Color("OurBlue").opacity(0.7))
                        .font(.system(size: 15, weight: .bold))
                        .padding(.bottom, 20)
                    
                    NavigationLink{
                        RegisterView()
                    }label: {
                        Text("Sign Up")
                            .foregroundColor(Color("OurPurple").opacity(0.7))
                            .font(.system(size: 15, weight: .bold))
                            .padding(.bottom, 20)
                    }
                }
                
            }
            .padding()
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
    func login(email: String, password: String){
        
        let dictionary: [String: Any] = [
            "email" : email,
            "password" : password
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


