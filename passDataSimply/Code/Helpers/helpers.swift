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
        let bear: animal = .init(image: UIImage(named: "bear")!, name: "bear")
        let cat: animal = .init(image: UIImage(named: "cat")!, name: "cat")
        let dog: animal = .init(image: UIImage(named: "dog")!, name: "dog")
        let elephant: animal = .init(image: UIImage(named: "elephant")!, name: "elephant")
        let monkey: animal = .init(image: UIImage(named: "monkey")!, name: "monkey")
        let penguin: animal = .init(image: UIImage(named: "penguin")!, name: "penguin")
        return [bear, cat, dog, elephant, monkey, penguin]
    }()
    var image: UIImage
    var name: String
}
