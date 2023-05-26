//
//  HomeVIew.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        // 1
        
        // 2
        List {
            
            Text("Home")
                .foregroundColor(Color("OurBlue"))
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 30, weight: .bold))
            ImageSlider()
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            HStack{
                
                VStack{
                    Text("Calle Igualdad 13, 28290")
                        .foregroundColor(Color("OurBlue"))
                        .fontWeight(Font.Weight.bold)
                    
                    Text("Contacto: 652859367    ")
                        .foregroundColor(Color("OurBlue"))
                        .fontWeight(Font.Weight.bold)
                }
                Spacer()
                
                
                Image("location")
                    .resizable()
                    .frame(width: 50, height: 50)
                    
            }
            
            Text("Sobre nosotros")
                .foregroundColor(Color("OurBlue"))
                .fontWeight(Font.Weight.bold)
                
                .padding(.leading, 80)
            
            Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur")
        }
        .navigationBarTitle("ALLSERVIX", displayMode: .large)
        
        //.frame(height: 600)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
