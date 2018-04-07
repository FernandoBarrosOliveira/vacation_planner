//
//  ComunicationUtils.swift
//  vacation planer
//
//  Created by Fernando Barros on 03/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

class WeatherService {
    
    static let URL_PADRAO = "http://localhost:8882"
    static let URL_CITIES = URL_PADRAO + "/cities/"
    static let URL_WEARTHER = URL_PADRAO + "/weather/"
    
    static func getCities(completion: @escaping ([Cities]) -> ())
    {
        
        let request = URL(string: URL_CITIES)
        let task = URLSession.shared.dataTask(with: request!) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            var citiesArray = [Cities]()
            if let data = data{
                do{
                     citiesArray = try JSONDecoder().decode([Cities].self, from: data);
                }catch{
                    print(error.localizedDescription)
                }
            }
            completion(citiesArray)
        }
        task.resume()
    }
    
    static func getWeather(completion: @escaping ([Weather]) -> ())
    {
        
        let request = URL(string: URL_WEARTHER)
        let task = URLSession.shared.dataTask(with: request!) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            var weatherArray = [Weather]()
            if let data = data{
                do{
                    weatherArray = try JSONDecoder().decode([Weather].self, from: data);
                }catch{
                    print(error.localizedDescription)
                }
            }
            completion(weatherArray)
        }
        task.resume()
    }
    
    static func getForecast(codeCity: String, year: String, completion: @escaping ([Forecast]) -> ())
    {
        
        let request = URL(string: URL_CITIES + "\(codeCity)/year/\(year)")
        let task = URLSession.shared.dataTask(with: request!) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            var forecastArray = [Forecast]()
            if let data = data{
                do{
                    forecastArray = try JSONDecoder().decode([Forecast].self, from: data);
                }catch{
                    print(error.localizedDescription)
                }
            }
            completion(forecastArray)
        }
        task.resume()
    }
    
    

    
}



