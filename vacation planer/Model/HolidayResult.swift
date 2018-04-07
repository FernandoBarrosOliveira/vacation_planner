//
//  HolidayResult.swift
//  vacation planer
//
//  Created by Fernando Barros on 05/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

struct HolidayResult {
    let dateInit: String?
    let dateEnd: String?
    let weatherDescriton: String?
    let averageMaxTemp: Double?
    let averageMinTemp: Double?
    
    init(dateInit: String, dateEnd: String, weatherDescriton: String,  averageMaxTemp: Double?, averageMinTemp: Double?  ) {
        self.dateInit = dateInit
        self.dateEnd = dateEnd
        self.weatherDescriton = weatherDescriton
        self.averageMaxTemp = averageMaxTemp
        self.averageMinTemp = averageMinTemp
    
    }
}
