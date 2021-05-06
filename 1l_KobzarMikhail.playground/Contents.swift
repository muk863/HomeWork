import Foundation

// 1. Решить квадратное уравнение.

//a!=0
//a*x^2+b*x+c=0
//d=pov(b,2)-4*a*c
//x= (-b(+-)sqrt(d))/2*a

let a: Double = 2
let b: Double = 7
let c: Double = -4
let d = pow(b, 2) - 4 * a * c
if d > 0 {
    let dis = sqrt(d)
    let xOne = (-b - dis) / (2 * a)
    let xTwo = (-b + dis) / (2 * a)
    print(xOne)
    print(xTwo)
} else if d == 0 {
    let x = -b / (2 * a)
    print (x)
} else {
    print ("Уравнение решений не имеет")
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let catA: Double = 3
let catB: Double = 4

print("Катет А равен:  \(catA)")
print("Катет В равен:  \(catB)")

let gip: Double = sqrt(pow(catA, 2) + pow(catB,2))
print("Гипотенуза равна:  \(gip)")

let p = catA + catB + gip
print("Периметр равен:  \(p)")

let s = 0.5 * catA * catB
print("Площадь равна:  \(s)")

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let deposit: Double = 1000000 // вклад
let interest: Double = 5 //проценты

let result1 = (deposit * interest / 100) + deposit
print ("Накопления за 1 год: \(result1)")

let result2 = (result1 * interest / 100) + result1
print ("Накопления за 2 года: \(result2)")

let result3 = (result2 * interest / 100) + result2
print ("Накопления за 3 года: \(result3)")

let result4 = (result3 * interest / 100) + result3
print ("Накопления за 4 года: \(result4)")

let result5 = (result4 * interest / 100) + result4
print ("Накопления за 5 лет: \(result5)")
