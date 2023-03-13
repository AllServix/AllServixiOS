//
//  ImageSliderView.swift
//  ServixApp
//
//  Created by alumnos on 13/3/23.
//

import SwiftUI

import SwiftUI



struct ImageSlider: View {
    
    // 1
    private let images = ["Pelu1", "Pelu2", "Pelu3", "Pelu4"]

    var body: some View {
        // 2
            TabView {
                ForEach(images, id: \.self) { item in
                    //3
                    Image(item)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(PageTabViewStyle())
    }


    struct ImageSlider_Previews: PreviewProvider {
        static var previews: some View {

            // 4
            ImageSlider()
                .previewLayout(.fixed(width: 400, height: 300))

        }

    }

}
