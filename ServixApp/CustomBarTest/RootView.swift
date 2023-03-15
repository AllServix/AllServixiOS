//
//  RootView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(Tabs.home)
            
            NewEventView()
                .tag(Tabs.add)
            
            ListView()
                .tag(Tabs.list)
            
            ProfileView()
                .tag(Tabs.profile)
        }
        
        Spacer()
        
        CustomTabView(selectedTab: $selectedTab)
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
