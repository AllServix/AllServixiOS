//
//  ListView.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//
import SwiftUI

struct EventResponseModel: Decodable{
    let name: String?
    let date: Int?

    
    enum CodingKeys: String, CodingKey{
        case name
        case date
    }


    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)

        
        if let date = try? values.decodeIfPresent(Int.self, forKey: .date) {
            self.date = date
        } else if let date = try? values.decodeIfPresent(String.self, forKey: .date) {
            self.date = Int(date)
        } else if let _ = try? values.decodeIfPresent(Float.self, forKey: .date) {
            self.date = nil
        } else {
            self.date = try values.decodeIfPresent(Int.self, forKey: .date)
        }
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

struct EventPresentationModel: Identifiable {

    let id = UUID()
    let name: String
    let date: Int

}

struct ListView: View {
    @State var dateSelected: Date = Date()
    @State var events: [EventPresentationModel] = []
    @State var showTicketView = false

    let day = Date()
    let dateFormatter = DateFormatter()
    
    var body: some View {

        ZStack{
            VStack{
                VStack(spacing: 10){
                    Image("Logo")
                        .resizable()
                        .frame(width: 130, height: 130)
                    Text("History")
                        .foregroundColor(Color("OurBlue"))
                        .font(.system(size: 30, weight: .bold))
                }

                ZStack{
                    Color("OurBlue")
                        .cornerRadius(5)
                        .frame(width: 380, height: 430)
                    
                    HStack{
                        ScrollView{
                            LazyVStack(spacing: 10) {
                                ForEach(events) { event in
                                    HStack{
                                        /*@START_MENU_TOKEN@*/Text(event.name)/*@END_MENU_TOKEN@*/
                                        Spacer()
                                        Button {
                                            //code
                                        } label: {
                                            Image("Trash")
                                                .frame(width:35, height: 35)
                                                .background(Color.white)
                                                .cornerRadius(10)
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                    .frame(height: 60)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(.horizontal, 15)
                                }
                            }
                        }
                        .padding(.bottom, 5)
                        .frame(width: 390, height: 400)
                    }
                }
            }
        }

        .sheet(isPresented: $showTicketView, content: {
            NewEventView()
        })
        .onAppear {
            getEvents()

        }
    }
    // MARK: - Private Methods
    // Llamada a la petición de NetworkHelper que pronto pasaremos a viewModel

    func getEvents(){
        //baseUrl + endpoint

        let url = "https://superapi.netlify.app/api/db/eventos"
        //peticion

        NetworkHelper.shared.requestProvider(url: url, type: .GET){ data, response, error in

            if let error = error{
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse{
                if response.statusCode == 200 { //esto daria ok
                    onSuccess(data: data)
                } else {
                    onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }

    

    func onSuccess(data: Data){

        do{
            let eventsNotFiltered = try JSONDecoder().decode([EventResponseModel?].self, from: data)
            self.events = eventsNotFiltered.compactMap({ eventNotFiltered in
                guard let date = eventNotFiltered?.date else { return nil }
                return EventPresentationModel(name: eventNotFiltered?.name ?? "Empty name", date: date)
            })
        }catch{
            self.onError(error: error.localizedDescription)
        }
    }

    

    func onError(error: String){

        print(error)

    }
}



struct AgendaView_Previews: PreviewProvider {

    static var previews: some View {
        ListView()
    }

}
