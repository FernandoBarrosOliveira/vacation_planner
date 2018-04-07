//
//  CitiesViewController.swift
//  vacation planer
//
//  Created by fa7labs on 07/04/18.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

    @IBOutlet var tableViewCities: UITableView!
    
    var cities = [Cities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService.getCities() { (results:[Cities]) in
            
            self.cities = results
        }
        
        self.tableViewCities.delegate = self
        self.tableViewCities.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesLabel", for: indexPath)
        
        let myCity = self.cities[indexPath.row]
        
        cell.textLabel?.text = myCity.district
        cell.detailTextLabel?.text = "\(myCity.province) - \(String(describing: myCity.stateAcronym)) (\(String(describing: myCity.country),String(describing: myCity.country))) "
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SearchTravel.city = cities[indexPath.row]
        self.navigationController?.popViewController(animated: true)
    }
  

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
