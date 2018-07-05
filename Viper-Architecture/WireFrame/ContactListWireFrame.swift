//
//  ContactListWireFrame.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import UIKit

class ContactListWireFrame: ContactListWireFrameProtocol {

    class func createContactListComponent() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ContactsNavigationController")
        if let view = navController.childViewControllers.first as? ContactViewController {
            var presenter : ContactsListPresenterProtocol & ContactListInteractorOutputProtocol = ContactsListPresenter()
            var interactor : ContactListInteractorInputProtocol & ContactsListServiceManagerOutputProtocol = ContactListInteractor() as ContactListInteractorInputProtocol & ContactsListServiceManagerOutputProtocol
            let service : ContactListServiceManagerInputProtocol = ContactsListWebservice()
            let wireFrame : ContactListWireFrameProtocol = ContactListWireFrame()
            view.presenter =  presenter;
            presenter.view = view;
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.networkDataManager = service
            service.networkRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
