//
//  CarouselComponent.swift
//  RandomList
//
//  Created by Pavan on 20/08/25.
//

import Foundation

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let uiModel: CarouselUIModel
    
    var uniqueId: String {
        ComponentType.carousel.rawValue
    }
    
    func renderView() -> AnyView {
        CarouselView(carouselModel: uiModel).toAnyView()
    }
}
