//
//  userData.swift
//  passDataSimply
//
//  Created by אורי האופטמן on 11/08/2020.
//

import UIKit

struct userData {
    static var selectedAnimal: animal? = nil
}

struct animal {
    /// All of the animals
    static let animals : [animal] = {
        let bear: animal = .init(image: UIImage(named: "bear")!, name: "Bear")
        let cat: animal = .init(image: UIImage(named: "cat")!, name: "Cat")
        let dog: animal = .init(image: UIImage(named: "dog")!, name: "Dog")
        let elephant: animal = .init(image: UIImage(named: "elephant")!, name: "Elephant")
        let monkey: animal = .init(image: UIImage(named: "monkey")!, name: "Monkey")
        let penguin: animal = .init(image: UIImage(named: "penguin")!, name: "Penguin")
        return [bear, cat, dog, elephant, monkey, penguin]
    }()
    var image: UIImage
    var name: String
}
