import Vapor
import FluentSQLite

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let dishesController = DishesController()
    router.get("api/dishes", use: dishesController.getAll)
    router.get("api/dish", Dish.parameter, use: dishesController.getById)

/*
    router.post(Dish.self, at: "api/dish") { request, dish ->
        Future<Dish> in

        return dish.save(on: request)

    }

    // Delete
    // for example Delete by "locashost:8080/api/dish/3"
    router.delete("api/dish",Dish.parameter) { req -> Future<Dish> in
        try req.parameters.next(Dish.self).delete(on: req)
    }

    router.get("api/dishes", String.parameter) { req -> Future<[Dish]> in

        let course = try req.parameters.next(String.self).lowercased()

        return try Dish.query(on: req)
            .filter(\.course == course).all()

    }

    // Get by a id
    // localhost:
    router.get("api/dish", Dish.parameter) { req -> Future<Dish> in
        return try req.parameters.next(Dish.self)
    }

    router.get("api/dishes") { req -> Future<[Dish]> in
        return Dish.query(on: req).all()
    }
*/


}

