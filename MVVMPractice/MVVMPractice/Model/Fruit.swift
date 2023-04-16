//
//  Fruit.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import Foundation


struct Fruit : Decodable {
    let genus : String
    let name : String
    let id : Int
    let family : String
    let order : String
    let nutritions : Nutrition
}

struct Nutrition : Decodable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Int
    let sugar: Double
}
