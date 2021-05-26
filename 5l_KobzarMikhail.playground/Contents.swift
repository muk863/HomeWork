import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum EngineStatus: String {
    case engineOn = "Двигатель запущен"
    case engineOff = "Двигатель не запущен"
}

enum WindowsStatus: String {
    case windowsOpen = "Окна открыты"
    case windowsClose = "Окна закрыты"
}

enum MusicStatus: String {
    case musicOn = "Музыка включена"
    case musicOff = "Музыка отключена"
}

protocol Car: AnyObject {
    
    var mark: String { get }
    var color: String { get }
    var year: Int { get }
    var engineStatus: EngineStatus { get set }
    
    func engineAction(action: EngineStatus)
}

extension Car {
    
    func engineAction(action: EngineStatus) {
        engineStatus = action
        print("\(engineStatus.rawValue)\n")
    }
}

class TrunkCar: Car {
    
    var mark: String
    var color: String
    var year: Int
    var engineStatus: EngineStatus
    
    var windowsStatus: WindowsStatus
    
    init(mark: String, color: String, year: Int, engineStatus: EngineStatus, windowsStatus: WindowsStatus) {
        self.mark = mark
        self.color = color
        self.year = year
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
    }
    
    func windowsAction(action: WindowsStatus) {
        windowsStatus = action
        print("\(windowsStatus.rawValue)\n")
    }
}

extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        return"Грузовой автомобиль:\nМарка: \(mark)\nЦвет: \(color)\nГод выпуска: \(year)\n\(engineStatus.rawValue)\n\(windowsStatus.rawValue)\n"
    }
}

var man = TrunkCar(mark: "MAN", color: "black", year: 2015, engineStatus: .engineOff, windowsStatus: .windowsClose)
var volvo = TrunkCar(mark: "Volvo", color: "white", year: 2018, engineStatus: .engineOn, windowsStatus: .windowsOpen)

print(man)
man.engineAction(action: .engineOn)
man.windowsAction(action: .windowsOpen)

print(volvo)
volvo.engineAction(action: .engineOff)
volvo.windowsAction(action: .windowsClose)

class SportCar: Car {
    
    var mark: String
    var color: String
    var year: Int
    var engineStatus: EngineStatus
    
    var musicStatus: MusicStatus
    
    init(mark: String, color: String, year: Int, engineStatus: EngineStatus, musicStatus: MusicStatus) {
        self.mark = mark
        self.color = color
        self.year = year
        self.engineStatus = engineStatus
        self.musicStatus = musicStatus
    }
    
    func musicAction(action: MusicStatus) {
        musicStatus = action
        print("\(musicStatus.rawValue)\n")
    }
}

extension SportCar: CustomStringConvertible {
    
    var description: String {
        return"Легковой автомобиль:\nМарка: \(mark)\nЦвет: \(color)\nГод выпуска: \(year)\n\(engineStatus.rawValue)\n\(musicStatus.rawValue)\n"
    }
}

var mazda = SportCar(mark: "Mazda", color: "green", year: 2019, engineStatus: .engineOn, musicStatus: .musicOn)
var honda = SportCar(mark: "Honda", color: "blue", year: 2021, engineStatus: .engineOff, musicStatus: .musicOff)

print(mazda)
mazda.engineAction(action: .engineOff)
mazda.musicAction(action: .musicOn)

print(honda)
honda.engineAction(action: .engineOn)
honda.musicAction(action: .musicOn)
