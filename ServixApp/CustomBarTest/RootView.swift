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
        
        
        Spacer()
        
        CustomTabView(selectedTab: $selectedTab)
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
