//
//  Cities.swift
//  vacation planer
//
//  Created by Fernando Barros on 03/04/2018.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import Foundation

struct Cities: Codable {
    let woeid: String?
    let district: String?
    let province: String?
    let stateAcronym: String?
    let country: String?
    

}

/*
 {
 "woeid": "455821",
 "district":"Porto Alegre",
 "province": "Rio Grande do Sul",
 "state_acronym": "RS",
 "country": "Brazil"
 }
 */
