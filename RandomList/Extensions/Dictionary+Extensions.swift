//
//  Dictionary+Extensions.swift
//  RandomList
//
//  Created by Pavan More on 08/08/25.
//

import Foundation

extension Dictionary {
    
    func decode<T: Decodable>() -> T? {
        guard let data =  try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
