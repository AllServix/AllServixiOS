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
            
            headerView
            
            
        }
    }
    
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
