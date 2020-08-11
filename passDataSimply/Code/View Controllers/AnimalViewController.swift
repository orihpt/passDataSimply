//
//  ViewController.swift
//  passDataSimply
//
//  Created by אורי האופטמן on 11/08/2020.
//

import UIKit

class AnimalViewController: UIViewController {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    
    @IBOutlet weak var addToZooButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Every time this view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Here we are getting the selected animal
        guard let selectedAnimal = userData.selectedAnimal else {
            // If there isn't any animal selected, it shows an error
            addToZooButton.alpha = 0
            animalImageView.alpha = 0
            animalNameLabel.text = NSLocalizedString("Unkown animal!", comment: "Shows when the selected animal is unkown")
            return
        }
        addToZooButton.alpha = 1
        animalImageView.alpha = 1
        
        animalImageView.image = selectedAnimal.image
        animalNameLabel.text = selectedAnimal.name
        self.navigationItem.title = animalNameLabel.text
        
        updateAddToZooButton()
    }
    
    func updateAddToZooButton() {
        // If there is no animal, exit
        if userData.selectedAnimal == nil {
            return
        }
        
        // If the animal is in the zoo
        if userData.zoo.contains(userData.selectedAnimal!) {
            addToZooButton.setTitle(NSLocalizedString("Remove from my zoo", comment: "A button to remove the current animal from the zoo."), for: .normal)
            addToZooButton.setTitleColor(.systemRed, for: .normal)
        } else {
            addToZooButton.setTitle(NSLocalizedString("Add to my zoo", comment: "A button to add the current animal to the zoo."), for: .normal)
            addToZooButton.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
        }
    }

    @IBAction func addToMyZooButtonPressed(_ sender: Any) {
        // If the animal is in the zoo
        if userData.zoo.contains(userData.selectedAnimal!) {
            // remove it from the zoo
            /// search for the index of the animal in the zoo and remove it
            for (index, animal) in userData.zoo.enumerated() {
                if animal == userData.selectedAnimal! {
                    userData.zoo.remove(at: index)
                }
            }
        } else {
            // add it to the zoo
            userData.zoo.append(userData.selectedAnimal!)
        }
        
        // update the button's title and color
        updateAddToZooButton()
    }
    
}

