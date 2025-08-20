//
//  NetworkService.swift
//  RandomList
//
//  Created by Pavan on 20/08/25.
//

import Foundation

protocol NetworkService {
    func load(_ resourceName: String) async throws -> ScreenModel
}
