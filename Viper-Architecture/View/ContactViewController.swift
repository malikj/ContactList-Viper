//
//  WeatherViewController.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit
import PKHUD

class ContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var presenter : ContactsListPresenterProtocol?
    
    var contactList = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ContactViewController:ContactListViewProtocol {
    
    func showError() {
        HUD.flash(.label("Not able to retrive contacts - Please try again later"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showContacts(with contacts: [Contact]) {
        contactList = contacts
        tableView.reloadData()
    }
}

extension ContactViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = self.contactList[indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactList.count
    }
}
