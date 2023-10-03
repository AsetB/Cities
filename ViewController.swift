//
//  ViewController.swift
//  Cities
//
//  Created by Aset Bakirov on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var citiesTableView: UITableView!
    
    var citiesArray = ["Almaty", "Washington", "Moscow", "Tashkent", "Lisbon", "Barcelona", "Baku", "Istanbul", "Beijing", "Berlin"]
    
    var countriesDict: [String : String] = ["Almaty" : "Kazakhstan", "Washington" : "USA", "Moscow" : "Russia", "Tashkent" : "Uzbekistan", "Lisbon" : "Portugal", "Barcelona" : "Spain", "Baku" : "Azerbaijan", "Istanbul" : "Turkey", "Beijing" : "China", "Berlin" : "Germany"]
    
    struct Constants {
        static let cellIdentifier = "CitiesCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let citiesText = citiesArray[indexPath.row]
        cellContentConfiguration.text = citiesText
        cellContentConfiguration.secondaryText = countriesDict[citiesText] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        return tableViewCell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("The tapped cell city is \(citiesArray[indexPath.row]), country is \(countriesDict[citiesArray[indexPath.row]] ?? "")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

