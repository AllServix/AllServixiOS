//
//  TicketView.swift
//  ServixApp
//
//  Created by Apps2T on 1/3/23.
//

import SwiftUI

struct TicketView: View {
    
    @State var showNewEvent:Bool = false
    
    var body: some View {
        
        VStack(spacing: 0, content: {
            ButtonBack(showLogin: $showNewEvent)
            
            MyHeader(text: "Ticket")
        })
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
