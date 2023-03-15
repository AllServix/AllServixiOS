//
//  SplashScreenView.swift
//  ServixApp
//
//  Created by alumnos on 14/3/23.
//

import SwiftUI

struct SplashScreenView: View {

    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {

        if isActive{
            LoginView()
        }else{
            VStack{
                VStack{
                    Image("Logo")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    Text("ALLSERVIX")
                        .font(Font.custom("Baskerville-bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }

    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
}
