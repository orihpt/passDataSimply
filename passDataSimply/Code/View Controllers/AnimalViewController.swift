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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Every time this view appears
    override func viewWillAppear(_ animated: Bool) {
        // Here we are getting the selected animal
        guard let selectedAnimal = userData.selectedAnimal else {
            // If there isn't any animal selected, it shows an error
            animalImageView.alpha = 0
            animalNameLabel.text = NSLocalizedString("Unkown animal!", comment: "Shows when the selected animal is unkown")
            return
        }
        animalImageView.image = selectedAnimal.image
        animalNameLabel.text = selectedAnimal.name
        self.navigationItem.title = animalNameLabel.text
    }


}

