//
//  ContentView.swift
//  RandomList
//
//  Created by Pavan on 07/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ListViewModel(service: LocalService())
    
    var body: some View {
       
        NavigationStack {
            ScrollView {
                ForEach(vm.components, id: \.uniqueId) { component in
                    component.renderView()
                }
                .navigationTitle("List")
            }
        }.task {
            await vm.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
