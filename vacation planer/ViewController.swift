//
//  ViewController.swift
//  vacation planer
//
//  Created by Fernando Barros on 17/02/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayHoliday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultLabel", for: indexPath)
        
        let myResult = self.arrayHoliday[indexPath.row]
        
        cell.textLabel?.text = "\(myResult.dateInit!) --> \(myResult.dateEnd!)"
        
        
        return cell
    }
    
    var arrayHoliday = [HolidayResult]()
    
    @IBOutlet weak var stepperDays: UIStepper!
    @IBOutlet weak var txtDays: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var textWeather: UITextField!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnWeather: UIButton!
    
    @IBOutlet weak var tvResult: UITableView!
    @IBOutlet weak var labelResult: UILabel!
    var forecasts = [Forecast]()
    
    @IBAction func SearchResults(_ sender: Any) {
        
        WeatherService.getForecast(codeCity: (SearchTravel.city?.woeid)!, year: "2018") {(results:[Forecast]) in
            
            self.forecasts = results
            
            self.arrayHoliday = ForecastBO.calculteBestPeriod(forcasts: self.forecasts, weathersChoice: SearchTravel.weather, daysOfHoliday: SearchTravel.days!)
            
            DispatchQueue.main.async {
                
                //let text = arrayHoliday.map{"\($0.dateInit!) - \($0.dateEnd!)"}.joined(separator: "\n")
                
                self.labelResult.text = "Resultados: \(self.arrayHoliday.count)"
                self.tvResult.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        clearSearch()
        updateSearch()
        
        self.tvResult.delegate = self
        self.tvResult.dataSource = self
        
    }

    @IBAction func DaysChange(_ sender: Any) {
        
        self.txtDays.text = Int((sender as! UIStepper).value).description
        SearchTravel.days = Int((sender as! UIStepper).value)
        updateSearch()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        
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
        
       // self.days = Int((sender as! UITextField).text!)!
    }
}

