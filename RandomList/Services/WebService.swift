//
//  WebService.swift
//  RandomList
//
//  Created by Pavan on 07/08/25.
//

import Foundation

enum NetworkError: Error {
    case InavlidUrl
    case InvalidHttpResponse
}

class WebService {
    
    func load(resource: String) async throws -> ScreenModel {
        
        guard let url = URL(string: resource) else {
            throw NetworkError.InavlidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else {
            throw NetworkError.InvalidHttpResponse
        }
        
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
