//
//  DishesController.swift
//  App
//
//  Created by masato on 10/11/2018.
//

import Foundation
import Vapor
import FluentSQLite

class DishesController : RouteCollection {

    func boot(router: Router) throws {


        let dishesRoutes = router.grouped("api/dishes")
        dishesRoutes.get("/", use: getAll)
        dishesRoutes.get(Dish.parameter, use: getById)
        dishesRoutes.post(Dish.self, at:"/", use:createDish)

//        router.get("api/dishes", use: getAll)
//        router.get("api/dish", Dish.parameter, use :getById)
    }

    func getByCourse(req :Request) throws -> Future<[Dish]> {

        let course = try req.parameters.next(String.self)

        return try Dish.query(on: req)
            .filter(\.course == course).all()

    }

    

    func createDish(req :Request, dish :Dish) -> Future<Dish> {
        return dish.save(on: req)
    }

    func getAll(req :Request) -> Future<[Dish]> {
        return Dish.query(on: req).all()
    }

    func getById(req :Request) throws -> Future<Dish> {
        return try req.parameters.next(Dish.self)
    }
}
