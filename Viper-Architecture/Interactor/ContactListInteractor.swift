//
//  WeatherInteractor.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

class ContactListInteractor: ContactListInteractorInputProtocol {
    
    var networkDataManager: ContactListServiceManagerInputProtocol?
    weak var presenter: ContactListInteractorOutputProtocol?
    func retrieveContactList() {
        networkDataManager?.retrieveContactList()
    }
}

extension ContactListInteractor: ContactsListServiceManagerOutputProtocol {
    
    func onContactsRetrieved(responseArray: [Any]) {
        self.parseServerResponse(response: responseArray)
    }
    func parseServerResponse (response:[Any]) {
        var contacts = [Contact]()
        for item  in response {
            print(item);
            let contact = Contact(response: item as! [String : Any])
            contacts.append(contact!)
        }
        presenter?.didRetrievePosts(contacts)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
