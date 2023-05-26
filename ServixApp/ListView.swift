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
        
        VStack{
            
            MyHeader(text: "Events")
                
            EventsListView()
        }
    }
}
    // MARK: - Private Methods
    



struct AgendaView_Previews: PreviewProvider {

    static var previews: some View {
        ListView()
    }

}
