//
//  ProfileView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI



struct ProfileView: View {
    
    @State var email: String = ""
    @State var nameFocused = false
    
    @State var showChange: Bool = false
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                Color("OurBlue")
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 200)
                    .opacity(0.6)
                
                Text("In Development")
                    .foregroundColor(Color.white)
            }
            
            
            VStack{
                
                MyHeader(text: "Perfil")
                
                DatosView()
                
                Spacer()
                
                buttonView
                
            }
        }
        
    }
    
    var buttonView: some View{
        Button {
            showChange = true
        } label: {
            Text("Cambiar contraseña")
                .font(.system(size: 17))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
                .padding(.bottom, 50)
                .padding(.horizontal, 100)
            
        }.background(
            NavigationLink(destination: ChangePassView(), isActive: $showChange) {
                EmptyView()
            })
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
