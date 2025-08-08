//
//  ScreenModel.swift
//  RandomList
//
//  Created by Pavan More on 07/08/25.
//

import Foundation

enum ComponentType: String, Decodable {
    case featuredImage
}

enum ComponetError: Error {
    case decoidingError
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: String]
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

extension ScreenModel {
    
    func buildCompoents() throws -> [UIComponent] {
        var componentArr:[UIComponent] = []
        for comppennet in self.components {
            switch comppennet.type {
                case .featuredImage:
                guard let uiModel: FeatureImageUIModel = comppennet.data.decode() else {
                    throw ComponetError.decoidingError
                }
                componentArr.append(FeaturedImageComponet(uiModel: uiModel))
            }
        }
        return componentArr
    }
}
