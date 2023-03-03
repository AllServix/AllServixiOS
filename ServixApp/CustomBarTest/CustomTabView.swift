//
//  CustomTabView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

enum Tabs: Int{
    case home = 0
    case add = 1
    case list = 2
    case profile = 3
}


struct CustomTabView: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack (alignment: .center){
            
            Button {
                //Switch to home
                selectedTab = .home
            } label: {
                GeometryReader { geo in
                    if selectedTab == .home {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: geo.size.width/4, height: 4)
                            .padding(.leading, geo.size.width/2.7)
                            .padding(.vertical, 10)
                                            
                    }
                    
                    VStack(alignment: .center, spacing: 4){
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width:32, height: 29)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(Color.white)
            
            
            Button {
                //Switch to add
                selectedTab = .add
            } label: {
                GeometryReader { geo in
                    if selectedTab == .add {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geo.size.width/4, height: 4)
                        .padding(.leading, geo.size.width/2.7)
                        .padding(.vertical, 10)

                }
                    VStack(alignment: .center, spacing: 4){
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width:32, height: 29)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(Color.white)
            Button {
                //Switch to list
                selectedTab = .list
            } label: {
                GeometryReader { geo in
                    if selectedTab == .list {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: geo.size.width/4, height: 4)
                            .padding(.leading, geo.size.width/2.7)
                            .padding(.vertical, 10)
                    }
                    VStack(alignment: .center, spacing: 4){
                        Image(systemName: "book")
                            .resizable()
                            .scaledToFit()
                            .frame(width:32, height: 29)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(Color.white)
            
            Button {
                //Switch to profile
                selectedTab = .profile
            } label: {GeometryReader { geo in
                if selectedTab == .profile {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geo.size.width/4, height: 4)
                        .padding(.leading, geo.size.width/2.7)
                        .padding(.vertical, 10)
                }
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width:32, height: 29)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .tint(Color.white)
            
        }
        .frame(height:82)
        .background(Color("OurBlue"))
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.home))
    }
}
