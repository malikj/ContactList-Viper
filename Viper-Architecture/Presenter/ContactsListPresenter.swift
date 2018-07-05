//
//  WeatherListPresenter.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

class ContactsListPresenter : ContactsListPresenterProtocol {
    
    var wireFrame: ContactListWireFrameProtocol?
    
    var view: ContactListViewProtocol?

    var interactor: ContactListInteractorInputProtocol?
        
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveContactList()
    }
}

extension ContactsListPresenter: ContactListInteractorOutputProtocol {
    
    func didRetrievePosts(_ contacts:[Contact]) {
        view?.hideLoading()
        view?.showContacts(with: contacts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }

}


