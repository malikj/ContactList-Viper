//
//  WeatherService.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

class ContactsListWebservice: ContactListServiceManagerInputProtocol {
    var networkRequestHandler: ContactsListServiceManagerOutputProtocol?
    func retrieveContactList() {
        Alamofire.request(Endpoints.Posts.fetch.url).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    print(resData);
                    self.networkRequestHandler?.onContactsRetrieved(responseArray: resData)
                }
                else {
                    self.networkRequestHandler?.onError()
                }
            }
            else {
                self.networkRequestHandler?.onError()
            }
        }
    }
}

