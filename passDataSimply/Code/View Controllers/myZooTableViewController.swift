//
//  myZooTableViewController.swift
//  passDataSimply
//
//  Created by אורי האופטמן on 11/08/2020.
//

import UIKit

class myZooTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Every time this view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.zoo.count
    }
    
    // When a cell need to be generated
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = .init(style: .default, reuseIdentifier: nil)
        
        // Get the animal from the zoo.
        let animal = userData.zoo[indexPath.row]
        
        cell.textLabel?.text = animal.name
        cell.imageView?.image = animal.image
        
        // The small arrow
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // When the user remove an animal from the zoo
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            userData.zoo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Can the user move the animals' locations in the zoo?
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // When the user move animal's location in the zoo
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let animal = userData.zoo.remove(at: fromIndexPath.row)
        userData.zoo.insert(animal, at: to.row)
        tableView.moveRow(at: fromIndexPath, to: to)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAnimal = userData.zoo[indexPath.row]
        
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
