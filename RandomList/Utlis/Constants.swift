//
//  Constants.swift
//  RandomList
//
//  Created by Pavan on 07/08/25.
//
import Foundation

//http://localhost:3000/nature-list
struct Constants {
    
    struct ScreenResources {
        
        static let baseUrl = "localhost:3000"
        static let petListing = "nature-list"
        
        static func resource(for resourceName: String) -> URL? {
            
            var components = URLComponents()
            components.scheme = "http"
            components.percentEncodedHost = baseUrl
            components.path = "/\(resourceName)"
            return components.url
        }
    }
    
    struct Urls {
        static let baseUrl = "http://localhost:3000"
        static let petListing = "\(baseUrl)/nature-list"
    }
}

