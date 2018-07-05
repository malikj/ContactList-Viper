//
//  WeatherListProtocols.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import UIKit

protocol ContactListViewProtocol {
    var presenter: ContactsListPresenterProtocol? { get set }
    func showContacts(with contacts: [Contact])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol ContactListWireFrameProtocol: class {
    static func createContactListComponent() -> UIViewController
}

protocol ContactListInteractorOutputProtocol: class {
    func didRetrievePosts(_ contacts:[Contact])
    func onError()
}

protocol ContactsListPresenterProtocol {
    var view: ContactListViewProtocol? { get set }
    var interactor: ContactListInteractorInputProtocol? { get set }
    var wireFrame: ContactListWireFrameProtocol? { get set }
    func viewDidLoad()
}

protocol ContactListInteractorInputProtocol  {
    var presenter: ContactListInteractorOutputProtocol? { get set }
    var networkDataManager : ContactListServiceManagerInputProtocol? {get set}
    func retrieveContactList()
}

protocol ContactListServiceManagerInputProtocol: class {
    var networkRequestHandler: ContactsListServiceManagerOutputProtocol? { get set }
    func retrieveContactList()
}

protocol ContactsListServiceManagerOutputProtocol: class {
    func onContactsRetrieved(responseArray:[Any])
    func onError()
}

