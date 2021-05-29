import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

enum Car: String {
    case sportCar = "Легковой автомобиль"
    case trunkCar = "Грузовой автомобиль"
}

class Auto {
    let car: Car
    let mark: String
    let year: Int
    
    init(car: Car, mark: String, year: Int) {
        self.car = car
        self.mark = mark
        self.year = year
    }
}

extension Auto: CustomStringConvertible {
    
    var description: String {
        return"\n\(car.rawValue), Марка: \(mark), Год выпуска: \(year)\n"
    }
}

struct Queue<T> {
    
    var cars: [T] = []
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var tempArray: [T] = []
        for i in cars {
            if predicate(i) {
                tempArray.append(i)
            }
        }
        return tempArray
    }
 
    mutating func push(_ element: T) {
        cars.append(element)
    }
    
    mutating func pop() -> T? {
        guard cars.count > 0 else { return nil }
        return cars.removeFirst()
    }
}

extension Queue {
    
    subscript(index: Int) -> T? {
        guard index >= 0 && index < cars.count else { return nil }
        return cars[index]
    }
}

var garage = Queue<Auto>()

garage.push(Auto(car: .sportCar, mark: "BMW", year: 2020))
garage.push(Auto(car: .trunkCar, mark: "MAN", year: 2015))
garage.push(Auto(car: .sportCar, mark: "Mersedes", year: 2021))
print(garage)

var filterGarage = garage.filter() { i in i.car == .sportCar }
print(filterGarage)

garage[2]
garage[5]

