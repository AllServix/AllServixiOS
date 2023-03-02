//
//  RootView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

struct RootView: View {
    
    @State var showHome : Bool = false
    @State var selectedTab: Tabs = 0
    
    var body: some View {
        
        VStack{
            
            switch selectedTab{
                    
            case 0:
                HomeView()
            case 1:
                NewEventView(showTicket: .constant(true))
            case 2:
                ListView()
                
            }
            Spacer()
         
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
