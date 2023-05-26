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
        self.address = "C/ igualdad 145"
        self.date = 0
        self.price = 0
    }
}

struct TicketView: View {
    
    var ticket: TicketPresentationModel
    @Binding var showTicketView: Bool
    @State var showHomeView: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //Logo y texto
            MyHeader(text: "Ticket")
            
            // Textfields
            textFieldsView
            
            //Botón
            buttonView(mode: presentationMode)
            
        }
        .navigationBarBackButtonHidden(true)
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
                //ticket.addres
                Text("Calle Igualdad 135")
                    .frame(width: 350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                
                
                //\(ticket.date)
                Text("12-03-2023")
                    .padding(.horizontal, 5)
                    .frame(width: 350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                //\(ticket.price)
                Text("30 $")
                    .frame(width:350, height: 80)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
            }
        }
    }
    
    
    
    func buttonView(mode:Binding<PresentationMode>) -> some View{
        
        Button {
            // TODO: - Login Action
            mode.wrappedValue.dismiss()
        } label: {
            Text("Exit")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(width: 180, height: 60)
            //.frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
            
        }
        
        .padding(.top, 50)
        
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(ticket: .init(address: "C/ Igualdad", date: 0, price: 0), showTicketView: .constant(true))
    }
}
