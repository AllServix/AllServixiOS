//
//  NavigationVarView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

struct NavigationVarView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "OurBlue")
    }
    var body: some View {
        TabView{
            HomeView()
                .tabItem(){
                    Image(systemName: "house.fill")
                        .foregroundColor(.red)
                }
            
            NewEventView(showTicket: .constant(true))
                .tabItem(){
                    Image(systemName: "plus")
                        .foregroundColor(.red)
                }
        }
        .accentColor(.white)
        .ignoresSafeArea()
        
    }
}

struct NavigationVarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationVarView()
    }
}
