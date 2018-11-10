//
//  DishesController.swift
//  App
//
//  Created by masato on 10/11/2018.
//

import Foundation
import Vapor
import FluentSQLite

class DishesController {


    func getAll(req :Request) -> Future<[Dish]> {
        return Dish.query(on: req).all()
    }

    func getById(req :Request) throws -> Future<Dish> {
        return try req.parameters.next(Dish.self)
    }
}
