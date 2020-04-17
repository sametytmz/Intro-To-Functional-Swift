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

// **************************************************************
// **************************************************************


/*
    Problem: Can you pass/return a funcion/functions to a function?
 */

// Note: Function = Global Closure

func hello() -> String {
    return "hello"
}

hello // () -> String

var addWithClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) -> Int in
        return number1 + number2
}

var returnString: () -> String = { () in
    return "hello"
}

var minusWithClosure: (Int, Int, Int) -> Double = { (num1:Int, num2: Int, num3: Int) -> Double in
    return Double(num1 + num2 + num3)
}


/*
    *** Return Closure ***
    Return Closure Indirectly
 */

func returnClosure() -> ((Int, Int) -> Int) {
    return addWithClosures
}

let returnedClosure = returnClosure()
returnedClosure(10, 10)
returnClosure()(10, 10)

// Return Closure Directly

// Practices
func returnClosureDirectly () -> ((Int, Int, Int) -> Double) {
    return { (num1: Int, num2: Int, num3: Int) -> Double in
        return Double(num1 + num2 + num3)
        
    }
}

func returnClosureDirectlyLess() -> ((Int, Int, Int) -> Double) {
    return { (num1, num2, num3) in
        Double(num1 + num2 + num3)
    }
}

func returnClosureDirectlyMoreLess() -> ((Int, Int, Int) -> Double) {
    return {
        Double($0 + $1 + $2)
    }
}


func  getClosure() -> ((Int, Int) -> Int) {
    return { (number1: Int, number2: Int) -> Int in
        return number1 + number2
    }
}

func getClosureLess() -> ((Int, Int) -> Int) {
    return { (num1, num2) in
        return num1 + num2
    }
}

func getClosureMoreLess() -> ((Int, Int) -> Int) {
    return {
        $0 + $1
    }
}

func getClosure() -> ((String) -> String) {
    return { (variable: String) -> String in
        return variable
    }
}

func getClosureLess() -> ((String) -> String) {
    return { (variable) in
        return variable
    }
}

func getClosureMoreLess() -> ((String) -> String) {
    return {
        $0
    }
}

getClosure()(20,20)
getClosure()("Samet")
returnClosureDirectly()(10,10,10)

let closureParam = returnClosureDirectly()
closureParam(10,10,10)
let closureParam2: ((Int, Int) -> Int) = getClosure()
closureParam2(10,20)


//: Pass Closure
func insertClosureBlock(closureBlock: () -> String) -> String {
    return closureBlock()
}

//: Pass Closure Indirectly
insertClosureBlock(closureBlock: hello)

let returnValue = insertClosureBlock(closureBlock: returnString)
insertClosureBlock(closureBlock: hello)

//: Pass Closure Directly
insertClosureBlock { () in
    return "Samet"
}

insertClosureBlock {
    return "Samet"
}

insertClosureBlock {
    "Samet"
}

let example = Array(1...200).filter{ $0 % 2 == 0}
print(example)
