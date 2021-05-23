import Foundation
/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

class Car {
    var mark: String
    var color: String
    var year: Int
    
    init(mark: String, color: String, year: Int) {
        self.mark = mark
        self.color = color
        self.year = year
        }
        
    func printInfoCar() {
        print("Автомобиль:")
        print("Марка: \(mark)")
        print("Цвет: \(color)")
        print("Год выпуска\(year) г.")
        print("")
    }
}

var bmw = Car(mark: "BMW",color: "black", year: 2021)
var mers = Car(mark: "Mersedes",color: "green", year: 2020)
bmw.printInfoCar()
mers.printInfoCar()


class SportCar: Car {
    
    var engine: engineAction
    
    enum engineAction {
        case engineStart
        case engineStop
    }
    
    init(mark: String, color: String, year: Int, engine: engineAction) {
        self.engine = engine
        super.init(mark: mark, color: color, year: year)
    }
    
    func engineAction (action: engineAction) {
        switch action {
        case .engineStart:
            print("Двигатель запущен")
        case .engineStop:
            print("Двигатель не запущен")
        }
    }
    func printInfoSportCar() {
        print("")
        print("Легковой автомобиль:")
        print("Марка: \(mark)")
        print("Цвет: \(color)")
        print("Год выпуска\(year) г.")
        if engine == .engineStart {
            print("Двигатель запущен")
        } else {
            print("Двигатель не запущен")
        }
        print("")
    }
}

var honda = SportCar(mark: "Honda", color: "Red", year: 2019, engine: .engineStop)
var lada = SportCar(mark: "Lada", color: "Yellow", year: 2019, engine: .engineStart)
honda.printInfoSportCar()
honda.engineAction(action: .engineStart)
honda.engineAction(action: .engineStop)
lada.printInfoSportCar()
lada.engineAction(action: .engineStop)


class TrunkCar: Car {
    
    var windows: windowsAction
    
    enum windowsAction {
        case windowsOpen
        case windowsClose
    }

    init(mark: String, color: String, year: Int, windows: windowsAction) {
        self.windows = windows
        super.init(mark: mark, color: color, year: year)
    }

    func windowsAction (action: windowsAction) {
        switch action {
        case .windowsOpen:
            print("Окна открыты")
        case .windowsClose:
            print("Окна закрыты")
        }
    }
    func printInfoTrunkCar() {
        print("")
        print("Грузовой автомобиль:")
        print("Марка: \(mark)")
        print("Цвет: \(color)")
        print("Год выпуска\(year) г.")
        if windows == .windowsOpen {
            print("Окна открыты")
        } else {
            print("Окна закрыты")
        }
        print("")
    }
}

var man = TrunkCar(mark: "MAN", color: "Black", year: 2015, windows: .windowsClose)
var kamaz = TrunkCar(mark: "Kamaz", color: "Blue", year: 2016, windows: .windowsOpen)
man.printInfoTrunkCar()
man.windowsAction(action: .windowsOpen)
man.windowsAction(action: .windowsClose)
kamaz.printInfoTrunkCar()
kamaz.windowsAction(action: .windowsClose)
