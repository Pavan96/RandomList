//
//  ListViewModel.swift
//  RandomList
//
//  Created by Pavan on 08/08/25.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
    private var service: WebService
    @Published var components: [UIComponent] = []
    
    init(service: WebService) {
        self.service = service
    }
    
    func load() async {
        do {
             let screenModel = try await service.load(resource: Constants.list)
             components = try screenModel.buildCompoents()
            
        } catch {
            print("Error heree")
        }
    }
}
