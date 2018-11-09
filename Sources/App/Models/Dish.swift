//
//  Dish.swift
//  App
//
//  Created by masato on 9/11/2018.
//

import Foundation
import Vapor
import FluentSQLite


final class Dish :Content {

    var id :Int?
    var title :String
    var description :String
    var price :Double
    var course :String
    var imageURL :String

    init(title :String, description :String, price :Double, course :String, imageURL :String) {
        self.title = title
        self.description = description
        self.price = price
        self.course = course
        self.imageURL = imageURL
    }

}


// DishをExtentionして、SQLiteが適合するようにする
extension Dish :SQLiteModel {
    static let entity :String = "dishes"
}

extension Dish :Migration { }
