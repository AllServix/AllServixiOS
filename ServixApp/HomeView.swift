//
//  HomeVIew.swift
//  ServixApp
//
//  Created by alumnos on 2/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        headerView
        
    }
}

var headerView: some View {
    Image("AllServix")
        .resizable()
        .frame(width: 140, height: 50)
        .padding(.top, 20)
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
