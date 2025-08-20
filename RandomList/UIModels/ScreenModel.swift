//
//  ScreenModel.swift
//  RandomList
//
//  Created by Pavan More on 07/08/25.
//

import Foundation

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
}

enum ComponetError: Error {
    case decoidingError
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
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
                
                case .carousel:
                    guard let uiModel: CarouselUIModel = comppennet.data.decode() else {
                        throw ComponetError.decoidingError
                    }
                    componentArr.append(CarouselComponent(uiModel: uiModel))
            }
        }
        return componentArr
    }
}
