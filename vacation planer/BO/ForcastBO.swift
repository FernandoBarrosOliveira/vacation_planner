//
//  ForcastBO.swift
//  vacation planer
//
//  Created by Fernando Barros on 05/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

class ForecastBO{
    
    static private func ForecastsToHolidayResult(forcasts:[Forecast]) -> HolidayResult{
        var maxTemp:Double = 0.0
        var minTemp:Double = 0.0
        for forecast in forcasts{
            maxTemp = maxTemp + forecast.temperature.max
            minTemp = minTemp + forecast.temperature.min
        }
        let dateInit = forcasts.first?.date
        let dateEnd = forcasts.last?.date
        let weatherDescrition = forcasts.first?.weather
        maxTemp = maxTemp / Double(forcasts.count)
        minTemp = minTemp / Double(forcasts.count)
        
        return HolidayResult(dateInit: dateInit!, dateEnd: dateEnd!, weatherDescriton: weatherDescrition!, averageMaxTemp: maxTemp, averageMinTemp: minTemp)
        
    }
    
    static func calculteBestPeriod(forcasts: [Forecast], weatherType: String, daysOfHoliday: Int) -> [HolidayResult]{
        var accumulatorForcast = [Forecast]()
        var arrayHolidayResult = [HolidayResult]()
        var NextForcastIndex = 0
        var actualIndex = 0
        
        for forcast in forcasts{
            if weatherType == forcast.weather && (NextForcastIndex == 0 || NextForcastIndex == actualIndex) {
                accumulatorForcast.append(forcast)
                NextForcastIndex = actualIndex + 1
                
            }else{
                NextForcastIndex = 0
                if accumulatorForcast.count > 0{
                  accumulatorForcast.removeAll()
                }
            }
            
            if accumulatorForcast.count == daysOfHoliday{
                arrayHolidayResult.append(ForecastsToHolidayResult(forcasts: accumulatorForcast))
                accumulatorForcast.removeAll()
                NextForcastIndex = 0
            }
            
            actualIndex = actualIndex + 1
            
        }
           return arrayHolidayResult
    }
  
    
    
}
