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
        VStack{
            
            MyHeader(text: "Perfil")
            
            DatosView()
            
            Spacer()
            
            buttonView
            
        }
    }
    
    var buttonView: some View{
        Button {
            
        } label: {
            Text("Cambiar contraseña")
                .foregroundColor(.white)
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
