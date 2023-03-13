//
//  TicketView.swift
//  ServixApp
//
//  Created by Apps2T on 1/3/23.
//

import SwiftUI

struct TicketPresentationModel {
    let address: String
    let date: Int
    let price: Int
    
    init(address: String, date: Int, price: Int) {
        self.address = address
        self.date = date
        self.price = price
    }
    
    init() {
        self.address = ""
        self.date = 0
        self.price = 0
    }
}

struct TicketView: View {
    
    var ticket: TicketPresentationModel
    @Binding var showTicketView: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //Logo y texto
            MyHeader(text: "Ticket")
            
            // Textfields
            textFieldsView
            
            //Botón
            buttonView
            
        }
        
        .background(Color.white)
        
    }
    
    
    
    // MARK: - Accessory Views
    
    var textFieldsView: some View {
        
        ZStack {
            
            Color("OurBlue")
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            
            VStack{
                Text(ticket.address)
                    .frame(width: 350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                
                Text("\(ticket.date)")
                    .padding(.horizontal, 5)
                    .frame(width: 350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                Text("\(ticket.price)")
                    .frame(width:350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
            }
        }
    }
    
    
    
    var buttonView: some View{
        
        Button {
            // TODO: - Login Action
            showTicketView = false
        } label: {
            Text("Exit")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(width: 180, height: 60)
            //.frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
            
        }.background( EmptyView()
                      
                      //            NavigationLink(destination: TicketView(), isActive: $showLogin) {
                      //
                      //                EmptyView()
                      //
                      //            }
        )
        
        .padding(.top, 50)
        
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(ticket: .init(address: "C/ Falsa", date: 12412, price: 214124), showTicketView: .constant(true))
    }
}
