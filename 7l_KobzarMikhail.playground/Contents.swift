import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


enum StoreError: Error {
    
    case wrongLot
    case outOfStock
    case notEnoughMoney(needMoney: Int)
    
    var malfunction: String {
        switch self {
        case .wrongLot:
            return "Не верно указан товар"
        case .outOfStock:
            return "Товар закончился"
        case .notEnoughMoney(needMoney: let needMoney):
            return "Для покупки пополните счет на: \(needMoney)"
        }
    }
}

struct Item {
    var lot: Lot
    var price: Int
    var available: Int
}

struct Lot {
    var title: String
}

class Store {
    var stock = [
        "Shirt": Item(lot: Lot(title: "Shirt"), price: 2000, available: 1),
        "Jacket": Item(lot: Lot(title: "Jacket"), price: 4000, available: 2),
        "Pants": Item(lot: Lot(title: "Pants"), price: 3000, available: 5)
    ]
    
    var money = 7000
    
    func buy(lot title: String) -> (lot: Lot?, error: StoreError?) {
        
        guard let item = stock[title] else {
            return (lot: nil, error: .wrongLot)
        }
        
        guard item.available > 0 else {
            return (lot: nil, error: .outOfStock)
        }
        
        guard item.price <= money else {
            return (lot: nil, error: StoreError.notEnoughMoney(needMoney: item.price - money))
        }
        
        money -= item.price
        var newItem = item
        newItem.available -= 1
        stock[title] = newItem
        return (lot: newItem.lot, error: nil)
    }
}

let store = Store()

let buy1 = store.buy(lot: "Socks")
let buy2 = store.buy(lot: "Shirt")
let buy3 = store.buy(lot: "Shirt")
let buy4 = store.buy(lot: "Jacket")
let buy5 = store.buy(lot: "Pants")

if let lot = buy1.lot {
    print("Поздравляем с покупкой: \(lot.title)")
} else if let error = buy1.error {
    print("Ошибка: \(error.malfunction)")
}

if let lot = buy2.lot {
    print("Поздравляем с покупкой: \(lot.title)")
} else if let error = buy2.error {
    print("Ошибка: \(error.malfunction)")
}

if let lot = buy3.lot {
    print("Поздравляем с покупкой: \(lot.title)")
} else if let error = buy3.error {
    print("Ошибка: \(error.malfunction)")
}

if let lot = buy4.lot {
    print("Поздравляем с покупкой: \(lot.title)")
} else if let error = buy4.error {
    print("Ошибка: \(error.malfunction)")
}

if let lot = buy5.lot {
    print("Поздравляем с покупкой: \(lot.title)")
} else if let error = buy5.error {
    print("Ошибка: \(error.malfunction)")
}

extension Store {
    
    func optionBuy(lot title: String) throws -> Lot {
        guard let item = stock[title] else {
            throw StoreError.wrongLot
        }
        
        guard item.available > 0 else {
            throw StoreError.outOfStock
        }
        
        guard item.price <= money else {
            throw StoreError.notEnoughMoney(needMoney: item.price - money)
        }
        
        money -= item.price
        var newItem = item
        newItem.available -= 1
        stock[title] = newItem
        return newItem.lot
    }
}

do {
    let buy10 = try store.optionBuy(lot: "Shirt")
    print("Поздравляем с покупкой: \(buy10.title)")
    
} catch StoreError.wrongLot {
    print("Не верно указан товар")
    
} catch StoreError.outOfStock {
    print("Товар закончился")
    
} catch StoreError.notEnoughMoney(needMoney: let needMoney) {
    print("Для покупки поплните счет на: \(needMoney)")
    
} catch let error {
    print(error)
}

do {
    let buy11 = try store.optionBuy(lot: "Сap")
    print("Поздравляем с покупкой: \(buy11.title)")
    
} catch StoreError.wrongLot {
    print("Не верно указан товар")
    
} catch StoreError.outOfStock {
    print("Товар закончился")
    
} catch StoreError.notEnoughMoney(needMoney: let needMoney) {
    print("Для покупки пополните счет на: \(needMoney)")
    
} catch let error {
    print(error)
}
