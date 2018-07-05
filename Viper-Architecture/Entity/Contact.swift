//
//  WeatherData.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

struct Contact {
    
    let name : String
    let id: String
    let address: String
    let email: String
    
    init?(response:[String:Any]) {
        guard let name  = response["name"],
            let id = response["id"],
            let address = response["address"],
            let email = response ["email"]
            else {
                return nil
        }
        self.id = id as! String
        self.name = name as! String
        self.address = address as! String
        self.email = email as! String

    }
}

