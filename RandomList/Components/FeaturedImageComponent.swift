//
//  FeaturedImageComponent.swift
//  RandomList
//
//  Created by Pavan  on 08/08/25.
//

import Foundation
import SwiftUI

struct FeaturedImageComponet: UIComponent {
    
    let uiModel: FeatureImageUIModel
    
    var uniqueId: String {
        return ComponentType.featuredImage.rawValue
    }
    
    func renderView() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
}
