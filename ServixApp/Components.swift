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

struct BackgroundColorView: View {
    var body: some View {
        Color.white.ignoresSafeArea()
    }
}


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
            .autocapitalization(.none)
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

struct ButtonBack: View{
    @Binding var mode: PresentationMode

    
    var body: some View{
        HStack{
            Button {
                mode.dismiss()
            } label: {
                Image(systemName: "arrow.left.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("OurBlue"))
            }
            Spacer()
        }
        .padding(.leading, 20)
    }
}

struct MyHeader: View{
    
    var text: String
    
    var body: some View{
        VStack(spacing: 15) {
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.top, 30)
            
            Text(text)
                .foregroundColor(Color("OurBlue"))
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 30)
            
        }
    }
}

struct DatosView: View{
    var body: some View{
        ZStack(alignment: .leading, content: {
            Text("Username:  Jose Romo" )
                .foregroundColor(Color("OurBlue"))
                .bold()
                .padding(.bottom, 30)
                
            Rectangle()
                .frame(height: 5)
                .padding(.top, 20)
                .foregroundColor(Color("OurBlue"))
        })
        .padding(.all, 30)
        
        ZStack(alignment: .leading, content: {
            Text("Email: joseromoluque@ gmail.com" )
                .foregroundColor(Color("OurBlue"))
                .bold()
                .padding(.bottom, 30)
                
            Rectangle()
                .frame(height: 5)
                .padding(.top, 20)
                .foregroundColor(Color("OurBlue"))
        })
        .padding(.all, 30)
        
        
    }
}

struct EventsListView: View {
    
    @State private var projects: [Project] = [
        Project(
            id: UUID(),
            service: "Corte caballero",
            date: "12-06-2023",
            image: Image("Logo")
            
        ),
            
        Project(
            id: UUID(),
            service: "Tinte y peinado",
            date: "01-06-2023",
            image: Image("Logo")
        ),
        
        Project(
            id: UUID(),
            service: "Corte y barba",
            date: "03-06-2023",
            image: Image("Logo")
        ),
        
        Project(
            id: UUID(),
            service: "Barbería",
            date: "10-06-2023",
            image: Image("Logo")
        ),
        
        Project(
            id: UUID(),
            service: "Tinte y peinado",
            date: "21-06-2023",
            image: Image("Logo")
        )
    ]


    
    @State private var selectedProjectIndex: Int? = nil

        var body: some View {
            NavigationView {
                List(0..<projects.count) { index in
                    let project = projects[index]
                    HStack(alignment: .center, spacing: 16) {
                        project.image
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text(project.service)
                            .foregroundColor(Color("OurBlue"))
                            .font(.system(size: 25))
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .onTapGesture {
                        selectedProjectIndex = index
                    }
                    //.background(
                        //NavigationLink(
                           // destination: ProjectDetailView(project: project),
                            //tag: index,
                            //selection: $selectedProjectIndex,
                            //label: { EmptyView() }
                        //)
                        //.hidden()
                    //)
                }
            }
        }
}



