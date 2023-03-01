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
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.top, 70)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(emailFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                        .offset(y: emailFocused ? 0 : 6)
                        .scaleEffect(emailFocused ? 1.5 : 1.2)
                    
                    TextField("", text: $email, onEditingChanged: { edited in
                        if edited {
                            withAnimation(.easeIn){
                                emailFocused = true
                            }
                        } else {
                            if email == "" {
                                withAnimation(.easeOut){
                                    emailFocused = false
                                }
                            }
                        }
                        
                    })
                    .disableAutocorrection(true)
                }
                .padding(.top, emailFocused ? 15 : 0)
                .background(
                    
                    Text("Email")
                        .padding(.leading, 30)
                        .scaleEffect(emailFocused ? 0.8 : 1)
                        .offset(x: emailFocused ? -1 : 0, y: emailFocused ? -18 : 8 )
                        .foregroundColor(emailFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                    ,alignment: .leading
                    
                ).padding(.horizontal)
                
                
                Rectangle()
                    .fill(emailFocused ? Color("OurBlue") : Color("OurBlue").opacity(0.7))
                    .opacity(emailFocused ? 1 : 0.7)
                    .frame(height : 5)
                    .padding(.top, 20)
            })
            .padding(.top, 12)
            .background(Color("OurBlue").opacity(0.22))
            .cornerRadius(5)
            .padding(.bottom, 25)
            
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
}

struct ForgottenPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgottenPassView()
    }
}

