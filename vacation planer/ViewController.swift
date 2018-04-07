//
//  ViewController.swift
//  vacation planer
//
//  Created by Fernando Barros on 17/02/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var pickerCity: UIPickerView!
    
    var cities = [Cities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService.getCities() { (results:[Cities]) in

            self.cities = results
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cities.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cities[row].district
    }
    
    
}

