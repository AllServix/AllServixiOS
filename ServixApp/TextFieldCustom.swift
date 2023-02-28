//
//  TextFieldCustom.swift
//  ServixApp
//
//  Created by Apps2T on 16/2/23.
//

import SwiftUI

//View

struct TextFieldCustomView: View {
    var placeholder: String
    var image: String
    var imageSize: CGSize
    @Binding var text: String
    @Binding var isFocused: Bool
    
    var body: some View {
        TextField("", text: $text, onEditingChanged: { edited in
            if edited {
                withAnimation(.easeIn){
                    isFocused = true
                }
            } else {
                if text == "" {
                    withAnimation(.easeOut){
                        isFocused = false
                    }
                }
            }
            
        })
        .disableAutocorrection(true)
        .modifier(TextFieldModifier(placeholder: placeholder, image: image, imageSize: imageSize, isFocused: $isFocused))
        
    }
}

// Modifier

struct TextFieldModifier: ViewModifier {
    var placeholder: String
    var image: String
    var imageSize: CGSize
    @Binding var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(height: 60)
            .padding(.leading, 50)
            .background(Color("OurBlue").opacity(0.22))
            .cornerRadius(5)
            .overlay(Rectangle()
                .fill(isFocused ? Color("OurBlue") : Color("OurBlue").opacity(0.7))
                .opacity(isFocused ? 1 : 0.7)
                .frame(height: 5)
                .padding(.top, 20), alignment: .bottom)
            .overlay(
                Image(systemName: image)
                    .resizable()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .foregroundColor(isFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                    .padding(.leading, 15)
                    .offset(y: -2)
                , alignment: .leading)
            .overlay(
                Text(placeholder)
                    .padding(.leading, 50)
                    .scaleEffect(isFocused ? 0.8 : 1)
                    .offset(x: isFocused ? -1 : 0, y: isFocused ? -18 : -2 )
                    .foregroundColor(isFocused ? Color("OurBlue"): Color("OurBlue").opacity(0.7))
                ,alignment: .leading
            )
    }
}
