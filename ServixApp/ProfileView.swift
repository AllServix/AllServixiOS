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
    
    var body: some View {
        VStack{
            
            MyHeader(text: "Perfil")
            
            
            
        }
    }
    
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
