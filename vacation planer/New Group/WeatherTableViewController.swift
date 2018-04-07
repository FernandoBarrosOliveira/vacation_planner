//
//  WeatherTableViewController.swift
//  vacation planer
//
//  Created by fa7labs on 07/04/18.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    @IBOutlet var tableViewWeather: UITableView!
    
    var weathers = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService.getWeather(){ (results:[Weather]) in
            
            self.weathers = results
        }
        SearchTravel.weather.removeAll(keepingCapacity: true)
        
        tableViewWeather.delegate = self
        self.tableViewWeather.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weathers.count
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherLabel", for: indexPath)
    
        cell.textLabel?.text = self.weathers[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SearchTravel.weather.append(weathers[indexPath.row])
//        self.navigationController?.popViewController(animated: true)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = SearchTravel.weather.index(where: {$0.id == weathers[indexPath.row].id}) {
            SearchTravel.weather.remove(at: index)
        }
    }

}
