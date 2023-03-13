//
//  ChangePassView.swift
//  ServixApp
//
//  Created by alumnos on 7/3/23.
//

import SwiftUI

struct ChangePassView: View {
    
    @State var password: String = ""
    @State var passwordFocused = false
    @State var newPassword: String = ""
    @State var newPasswordFocused = false
    @State var repeatPassword: String = ""
    @State var repeatPasswordFocused = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var showLogin:Bool = false

    var body: some View {
        VStack{
            
            ButtonBack(mode: mode)
            
            MyHeader(text: "Cambiar contraseña")
            
            textFieldsView
            
            Spacer()
            
            buttonView
        }
    }
    
    var textFieldsView: some View {
        VStack(spacing: 12) {
            TextFieldCustomView(placeholder: "Contraseña actual", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $password, isFocused: $passwordFocused)
            
            TextFieldCustomView(placeholder: "Nueva contraseña", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $newPassword, isFocused: $newPasswordFocused)
                .padding(.top, 20)
            
            TextFieldCustomView(placeholder: "Repetir nueva contraseña", image: "lock.fill", imageSize: CGSize(width: 17, height: 23), text: $repeatPassword, isFocused: $repeatPasswordFocused)
                .padding(.top, 20)
            
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
    
    var buttonView: some View{
        Button {
            // TODO: - Login Action
        } label: {
            Text("Aceptar")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
                .padding(.bottom, 50)
                .padding(.horizontal, 100)
            
        }.background(
            NavigationLink(destination: LoginView(), isActive: $showLogin) {
                EmptyView()
            })
    }
    
    func login(password: String, newPass: String, repeatNewPass: String){
        
        let dictionary: [String: Any] = [
            "password" : password,
            "newPass": newPass,
            "repeatNewPass": repeatNewPass
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
        showLogin = true
    }
    
    func onError(error: String){
        
    }
}

struct ChangePassView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassView()
    }
}
