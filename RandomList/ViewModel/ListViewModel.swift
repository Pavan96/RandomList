//
//  ListViewModel.swift
//  RandomList
//
//  Created by Pavan on 08/08/25.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        do {
            let screenModel = try await service.load(Constants.ScreenResources.petListing)
            components = try screenModel.buildCompoents()
            
        } catch {
            print("Error heree")
        }
    }
}
