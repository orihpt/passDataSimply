//
//  AnimalsTableViewController.swift
//  passDataSimply
//
//  Created by אורי האופטמן on 11/08/2020.
//

import UIKit

class AnimalsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Here we set the number of rows to be the number of the animals
        return animal.animals.count
    }
    
    // When a cell need to be generated
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Here we creating a cell for each animal
        let cell: UITableViewCell = .init(style: .default, reuseIdentifier: nil)

        cell.textLabel?.text = animal.animals[indexPath.row].name
        cell.imageView?.image = animal.animals[indexPath.row].image
        
        // The small arrow
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    // When the user press a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAnimal = animal.animals[indexPath.row]
        
        // Here we are writing what animal did the user pressed
        userData.selectedAnimal = selectedAnimal
        
        // Now, we are showing the Animal View Controller
        
        let viewControllerIdentifier = "animalVC"
        // The identifier can found and be edited by:
        /// - 1. Open the storyboard.
        /// - 2. Select the 'Animal View Controller' View Controller.
        /// - 3. Open the menu on the left side of the screen.
        /// - 4. In the navigation bar on the top of the screen, press the litle newspaper icon
        /// - 5. The identifier is 'Storyboard ID'
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as UIViewController
        navigationController?.pushViewController(secondViewController, animated: true)
    }

}
