//
//  userData.swift
//  passDataSimply
//
//  Created by אורי האופטמן on 11/08/2020.
//

import UIKit

struct userData {
    static var selectedAnimal: Animal? = nil
    static var zoo: [Animal] = []
}

/// Our animal struct. Equatable protocol to be able to do things like 'if cat == bear'
struct Animal: Equatable {
    /// All of the animals
    static let animals : [Animal] = {
        let bear: Animal = .init(image: UIImage(named: "bear")!, name: "Bear")
        let cat: Animal = .init(image: UIImage(named: "cat")!, name: "Cat")
        let dog: Animal = .init(image: UIImage(named: "dog")!, name: "Dog")
        let elephant: Animal = .init(image: UIImage(named: "elephant")!, name: "Elephant")
        let monkey: Animal = .init(image: UIImage(named: "monkey")!, name: "Monkey")
        let penguin: Animal = .init(image: UIImage(named: "penguin")!, name: "Penguin")
        return [bear, cat, dog, elephant, monkey, penguin]
    }()
    var image: UIImage
    var name: String
}
