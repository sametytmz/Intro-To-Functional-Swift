import UIKit

/*
    Trailing Closures
    Problem: A closure is too long to pass through a function
 */


// Design Function

func trailingClosure(number: Int, closure: () -> Void) {
    print("You've entered \(number)")
    closure()
}


//: Design Closure block
func helloFunc() -> Void {
    print("Hello, Function!")
}

let helloClosure = { () in
    print("Hello, Closure!")
}

helloFunc()

helloClosure()

// Pass closure indeirectly
trailingClosure(number: 100, closure: helloFunc)
trailingClosure(number: 100, closure: helloClosure)

// Pass closure directly
trailingClosure(number: 100, closure: {() in print("Hello!!!")})
trailingClosure(number: 100) {
    print("Hello!!!")
}

/*
    When to use trailing closure
    -- A single closure block at the end
 */

//: Another Example
func trailingClosures(number: Int, closure: (Int) -> Int) {
    let newNumber = closure(number)
    print(newNumber)
}

trailingClosures(number: 1000, closure: {number1 in number1 * number1})
trailingClosures(number: 500) { (number) in
    number * number
}
trailingClosures(number: 400) { $0 * $0 }
