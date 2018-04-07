//
//  Forecast.swift
//  vacation planer
//
//  Created by Fernando Barros on 04/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    var date: String
    var temperature: Temperature
    var weather: String
    var woeid: String
}
