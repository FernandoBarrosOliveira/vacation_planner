//
//  ViewController.swift
//  vacation planer
//
//  Created by Fernando Barros on 17/02/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WeatherService.getForecast(codeCity: "455823", year: "2015") { (results:[Forecast]) in
            var arrayHolidayResult = [HolidayResult]()
            arrayHolidayResult = ForecastBO.calculteBestPeriod(forcasts: results, weatherType: "windy", daysOfHoliday: 2)
            for holidayResult in arrayHolidayResult{
                print(holidayResult.dateInit! + " - " + holidayResult.dateInit!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

