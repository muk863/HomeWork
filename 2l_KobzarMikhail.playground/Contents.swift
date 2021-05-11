import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

let number = 10

func even() {
    if number % 2 == 0 {
        print("число четное")
    } else {
        print("число нечетное")
    }
}
even()

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func div() {
    if number % 3 == 0 {
        print("число делится без остатка на 3")
    } else {
        print("число не делится на 3 без остатка")
    }
}
div()


 //3. Создать возрастающий массив из 100 чисел.

//способ 1

var myArray: [Int] = []
for i in 1...100 {
    myArray.append(i)
}
print("Количество элементов массива: \(myArray.count)")
print(myArray)


//способ 2

let myArrayy = Array(1...100)

print("Количество элементов массива: \(myArray.count)")
print(myArrayy)


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.


//вариант .filter

var filterArray = myArray.filter({$0 % 2 > 0 && $0 % 3 > 0})
print(filterArray)


// вариант .remove

for value in myArray {
    if (value % 2) == 0  || (value % 3) == 0 {
        myArray.remove(at: myArray.firstIndex(of: value)!)
    }
}
print(myArray)


// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
// Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.


var fibArray = [0, 1]

func fibonacci(n: Int) -> [Int] {
    while fibArray.count < n {
        fibArray.append(fibArray[fibArray.count - 1] + fibArray[fibArray.count - 2])
    }
    return fibArray
}

print(fibonacci(n: 50))



//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
// e. Повторять шаги c и d, пока возможно.


/*
//проверка числа на простое
func prime (number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

*/


// проверка числа на простое
func prime(_ number: Int) -> Bool {
return number > 1 && !(2..<number).contains { number % $0 == 0 }
}


//свод массива
func primeArray () -> [Int] {
    var result = [Int]()
    var i = 2
    while result.count < 100 {
        if prime(i) {
            result.append(i)
        }
        i += 1
    }
    return result
}

print(primeArray())
