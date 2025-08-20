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

class WebService: NetworkService {
    
    func load(_ resource: String) async throws -> ScreenModel {
        
        guard let url = Constants.ScreenResources.resource(for: resource) else {
            throw NetworkError.InavlidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let res = (response as? HTTPURLResponse)
            print("response: \(String(describing: res))")
            print("response: \(String(describing: res?.statusCode))")

            throw NetworkError.InvalidHttpResponse
        }
        
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}

