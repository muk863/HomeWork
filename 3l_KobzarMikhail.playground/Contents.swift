import Foundation
/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
 */

struct SportCar {
    var mark: String
    var year: Int
    var trunkTotalSpace: Int
    var trunkSpaceLevel: Int
    var engineOn: Bool
    var windowsOpen: Bool

    enum Action {
        case engineStart
        case engineStop
        case windowOpen
        case windowClose
        case trunkLoad(liters: Int)
        case trunkUnload(liters: Int)
    }
    
    mutating func executeAction (action: Action) {
        switch action {
        case .engineStart:
            engineOn = true
            print("Двигатель запущен")
        case .engineStop:
            engineOn = false
            print("Двигатель не запущен")
            
        case .windowOpen:
            windowsOpen = true
            print("Окна открыты")
        case .windowClose:
            windowsOpen = false
            print("Окна закрыты")
            
        case .trunkLoad(let liters):
            if liters <= (trunkTotalSpace - trunkSpaceLevel) {
                trunkSpaceLevel += liters
                print("Загрузка багажника \(trunkSpaceLevel) л.")
            } else {
                print("Загружено: \(trunkTotalSpace - trunkSpaceLevel) л. Груз не влез.")
            }
            
        case .trunkUnload(let liters):
            if liters >= trunkSpaceLevel {
                print("Груза слишком мало. Разгружено \(trunkSpaceLevel)")
            } else {
                trunkSpaceLevel -= liters
                print("Багажник разгружен на \(liters) л., текущая загрузка \(trunkSpaceLevel) л.")
            }
        }
    }
    
    func printSportCar(){
        print("")
        print("Легковой автомобиль")
        print("Марка: \(mark)")
        print("Год выпуска: \(year) г.")
        print("Объем багажника: \(trunkTotalSpace) л.")
        print("Загрузка багажника: \(trunkSpaceLevel) л.")
        
          if engineOn == true {
              print("Двигатель запущен")
          } else {
              print("Двигатель не запущен")
          }

          if windowsOpen == true {
              print("Окна открыты")
          } else {
              print("Окна закрыты")
          }
        print("")
    }
}

var bmw = SportCar(mark: "BMW", year: 2021, trunkTotalSpace: 500, trunkSpaceLevel: 300, engineOn: true, windowsOpen: false)
var mers = SportCar(mark: "Mersedes", year: 2020, trunkTotalSpace: 400, trunkSpaceLevel: 100, engineOn: false, windowsOpen: false)

bmw.printSportCar()
bmw.executeAction(action: .engineStop)
bmw.executeAction(action: .windowOpen)
bmw.executeAction(action: .trunkLoad(liters: 100))

mers.printSportCar()
mers.executeAction(action: .engineStart)
mers.executeAction(action: .trunkLoad(liters: 500))
mers.executeAction(action: .trunkUnload(liters: 90))

struct TrunkCar {
    var mark: String
    var year: Int
    var trunkTotalSpace: Int
    var trunkSpaceLevel: Int
    var engineOn: Bool
    var windowsOpen: Bool

    enum Action {
        case engineStart
        case engineStop
        case windowOpen
        case windowClose
        case trunkLoad(liters: Int)
        case trunkUnload(liters: Int)
    }
    
    mutating func executeAction (action: Action) {
        switch action {
        case .engineStart:
            engineOn = true
            print("Двигатель запущен")
        case .engineStop:
            engineOn = false
            print("Двигатель не запущен")
            
        case .windowOpen:
            windowsOpen = true
            print("Окна открыты")
        case .windowClose:
            windowsOpen = false
            print("Окна закрыты")
            
        case .trunkLoad(let liters):
            if liters <= (trunkTotalSpace - trunkSpaceLevel) {
                trunkSpaceLevel += liters
                print("Загрузка кузова \(trunkSpaceLevel) л.")
            } else {
                print("Загружено: \(trunkTotalSpace - trunkSpaceLevel) л. Груз не влез.")
            }
            
        case .trunkUnload(let liters):
            if liters >= trunkSpaceLevel {
                print("Груза слишком мало. Разгружено \(trunkSpaceLevel)")
            } else {
                trunkSpaceLevel -= liters
                print("Кузов разгружен на \(liters) л., текущая загрузка \(trunkSpaceLevel) л.")
            }
        }
    }
    
    func printTrunktCar(){
        print("")
        print("Грузовой автомобиль")
        print("Марка: \(mark)")
        print("Год выпуска: \(year) г.")
        print("Объем кузова: \(trunkTotalSpace) л.")
        print("Загрузка кузова: \(trunkSpaceLevel) л.")
        
          if engineOn == true {
              print("Двигатель запущен")
          } else {
              print("Двигатель не запущен")
          }

          if windowsOpen == true {
              print("Окна открыты")
          } else {
              print("Окна закрыты")
          }
        print("")
    }
}

var kam = TrunkCar(mark: "Камаз", year: 2015, trunkTotalSpace: 10000, trunkSpaceLevel: 5000, engineOn: false, windowsOpen: true)
var man = TrunkCar(mark: "MAN", year: 2016, trunkTotalSpace: 15000, trunkSpaceLevel: 3000, engineOn: true, windowsOpen: true)

kam.printTrunktCar()
kam.executeAction(action: .engineStart)
kam.executeAction(action: .trunkUnload(liters: 4000))

man.printTrunktCar()
man.executeAction(action: .windowClose)
man.executeAction(action: .trunkLoad(liters: 10000))
man.executeAction(action: .engineStop)
