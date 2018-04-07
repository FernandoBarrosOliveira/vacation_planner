//
//  Temperature.swift
//  vacation planer
//
//  Created by Fernando Barros on 03/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

class Temperature: Codable {
    let max: Double
    let min: Double
    let unit: String
    
    init(max: Double, min: Double, unit: String) {
        self.max = max
        self.min = min
        self.unit = unit
    }
}
