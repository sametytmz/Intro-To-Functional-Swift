import UIKit

/*
    Intro To Closures Part 1
    Problem: Who are you closures, () -> ()?
 */
 

/*
    -- A closure is a function without name and the func keyword (for now)
    -- Quick and easy to carry around as a variable/constant or just pass as a parameter
 */


// Function add two ints
func addTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

addTwoNumbers(number1: 30, number2: 30)

var addFunction = addTwoNumbers
addFunction(10,20)

var addClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) in
    return number1 + number2
}

var addClosuresTwo = { (number1: Int, number2: Int) in
    return number1 + number2
}

var addClosureThree = { (number1: Int, number2: Int) in
    number1 + number2
}

addClosures(10, 20)
addClosureThree(4,6)

var addClosureFour : (Int, Int) -> Int = { $0 + $1 }
addClosureFour(4, 10)


//: One example with () -> String
func callString() -> String {
    return "Hello, I'm a function"
}

let callStringWithClosure: () -> String = { () in
    return "Hello, I'm a closure"
}

callStringWithClosure()

// Skip return
let callStringWithClosureTwo: () -> String = { () in
    "Hello, I'm a closure"
}

// Shorter Version
let callStringWithClosureThree = { () in
    return "Hello, I'm a closure"
}

let callStringWithClosureFour = {"Hello, I'm a closure" }

callStringWithClosureFour()
