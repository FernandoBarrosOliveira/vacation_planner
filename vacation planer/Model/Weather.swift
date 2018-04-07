//
//  Weather.swift
//  vacation planer
//
//  Created by Fernando Barros on 03/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation


struct Weather: Codable {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
