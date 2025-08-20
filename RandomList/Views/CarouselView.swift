//
//  CarouselView.swift
//  RandomList
//
//  Created by Pavan on 20/08/25.
//

import SwiftUI

struct CarouselView: View {
    
    let carouselModel: CarouselUIModel
    
    var body: some View {
       
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselModel.imageUrls, id: \.self) { url in
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carouselModel: CarouselUIModel(imageUrls: []))
    }
}
