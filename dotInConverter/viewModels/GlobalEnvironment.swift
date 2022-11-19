//
//  GlobalEnvironment.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/19.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    
    @Published var display = GlobalEnvironment.defaultDisplay
    
    static let defaultDisplay = "0"
}
