//
//  NewEventView.swift
//  ServixApp
//
//  Created by José Santiago  Romo Luque on 28/2/23.
//

import SwiftUI

//CAMBIAR
struct EventResponseModel2: Decodable {
    let address: String?
    let price: Int?
    let date: Int?
}

struct NewEventView: View {
    @State var showTicketView: Bool = false
    @State var date: Date = Date()
    @State var name: String = ""
    
    var services = ["cejas", "Corte", "Tinte", "Mechas", "Barberia"]
    var servicesAssociated = ["cejas": 5,
                              "Corte" : 4,
                              "Tinte" : 2,
                              "Mechas" : 3,
                              "Barberia" : 1]
    @State private var selectedService = "Service"
    
    @State private var ticket: TicketPresentationModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                
                MyHeader(text: "Nueva cita")
                
                fieldsView
                
                Spacer()
                
                buttonView
                
            }
        }
    }
    
    var fieldsView: some View{
        VStack{
            
            Text("Elige un servicio")
                .foregroundColor(Color("OurBlue"))
                .bold()
            
            Picker("Please choose a color", selection: $selectedService) {
                ForEach(services, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.automatic)
            .tint(.black)
            .frame(width: 300, height: 40, alignment: .center)
            .background(Color("OurBlue").opacity(0.22))
            
            Text("Elige una fecha")
                .foregroundColor(Color("OurBlue"))
                .bold()
                .frame(alignment: .leading)
            
            DatePicker("", selection: $date, displayedComponents: .date)
                .frame(height:100)
                .datePickerStyle(.wheel)
                .background(Color("OurBlue").opacity(0.22))
                .cornerRadius(5)
                .padding(.horizontal, 10)
                .padding(.top, 20)
                .overlay(
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 48, height: 48, alignment: .leading)
                        .foregroundColor(Color("OurBlue").opacity(0.7))
                        .padding(.leading, 15)
                        .offset(x:10, y: 10)
                    , alignment: .leading)
                .overlay(Rectangle()
                    .fill(Color("OurBlue"))
                    .frame(width: 390, height: 5)
                    .padding(.top, 20), alignment: .bottom)
        }
        .padding(.top, 100)
    }
    
    var buttonView: some View{
        Button {
            // TODO: - Event register func
            eventRegister()
        } label: {
            Text("Continuar")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(width: 180, height: 60)
            //.frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
            
        }.background(
            NavigationLink(destination: TicketView(ticket: .init(address: ticket.address, date: ticket.date, price: ticket.price), showTicketView: $showTicketView), isActive: $showTicketView) {
                EmptyView()
            })
        .padding(.bottom, 50)
    }
    private func eventRegister() {
        
        //baseUrl + endpoint
        let url = "https://superapi.netlify.app/api/db/eventos"
        
        //params
        // CAMBIAR
        
        guard let serviceId = servicesAssociated[selectedService] else { return }
        let dateFormatter = DateFormatter()
        let dateString = dateFormatter.string(from: date)
        
        let dictionary: [String: Any] = [
            "service" : serviceId,
            "date" : dateString
        ]
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    onSuccess(data)
                } else { // esto daria error
                    onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    
    func onSuccess(_ data: Data) {
        do{
            let ticketsNotFiltered = try JSONDecoder().decode(EventResponseModel2?.self, from: data)
            ticket = .init(address: ticketsNotFiltered?.address ?? "", date: ticketsNotFiltered?.date ?? 0, price: ticketsNotFiltered?.price ?? 0)
            showTicketView = true
        } catch {
            onError(error: error.localizedDescription)
        }
    }
    
    func convertDateToInt(date: Date) -> Int{
        let intDate = Int(date.timeIntervalSince1970 * 1000)
        return intDate
    }
    func onError(error: String) {
        
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView()
    }
}
