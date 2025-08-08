//
//  UIComponent.swift
//  RandomList
//
//  Created by Pavan on 08/08/25.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: String { get }
    func renderView() -> AnyView
}
