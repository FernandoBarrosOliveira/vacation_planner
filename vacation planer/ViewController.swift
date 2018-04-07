//
//  ViewController.swift
//  vacation planer
//
//  Created by Fernando Barros on 17/02/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stepperDays: UIStepper!
    @IBOutlet weak var txtDays: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var textWeather: UITextField!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnWeather: UIButton!
    
    var days = 0
    var city : Cities?
    var weathers = [Weather]()
    
    var cities = [Cities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService.getCities() { (results:[Cities]) in

            self.cities = results
        }
        updateSearch()
        
    }

    @IBAction func DaysChange(_ sender: Any) {
        
        self.txtDays.text = Int((sender as! UIStepper).value).description
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        //txtCity.text = SearchTravel.city?.district
        updateSearch()
    }
   
    func clearSearch () {
        
        SearchTravel.city = nil
        SearchTravel.days = 1
        SearchTravel.weather.removeAll()
    }
    
    func updateSearch() {
        
        self.textWeather.text = SearchTravel.weather.map{$0.name}.joined(separator: ", ")
        self.txtCity.text = SearchTravel.city?.district
        self.txtDays.text = SearchTravel.days?.description
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func UpdateDays(_ sender: Any) {
        
        self.days = Int((sender as! UITextField).text!)!
    }
}

