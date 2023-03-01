//
//  NewEventView.swift
//  ServixApp
//
//  Created by José Santiago  Romo Luque on 28/2/23.
//

import SwiftUI

struct NewEventView: View {
    @Binding var showTicket: Bool
    @State var date: Date = Date()
    @State var name: String = ""
    
    var completion: () -> () = {}
    
    var services = ["Service","Corte de caballero", "Green", "Blue", "Tartan"]
    @State private var selectedService = "Service"
    
    var body: some View {
        VStack{
            
            headerView
            
            
            fieldsView
            
            Spacer()
            
            buttonView
            
        }
        
    }
    var headerView: some View {
        VStack(spacing: 15) {
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.top, 30)
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
            // TODO: - Login Action
        } label: {
            Text("Continuar")
                .foregroundColor(.white)
                .font(.system(size: 27))
                .frame(width: 180, height: 60)
            //.frame(maxWidth: .infinity)
                .background(Color("OurBlue"))
                .cornerRadius(15)
            
        }.background(
            NavigationLink(destination: LoginView(), isActive: $showTicket) {
                EmptyView()
            })
        .padding(.bottom, 50)
    }
    private func eventRegister(name: String, date: Int) {
        
        //baseUrl + endpoint
        let url = "https://superapi.netlify.app/api/db/eventos"
        
        //params
        let dictionary: [String: Any] = [
            "name" : name,
            "date" : date
        ]
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    onSuccess()
                } else { // esto daria error
                    onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    func createEvent(){
        let myDate = convertDateToInt(date: date)
        eventRegister(name: name, date: myDate )
    }
    
    
    func onSuccess(){
        completion()
        showTicket = false
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
        NewEventView(showTicket: .constant(true))
    }
}
