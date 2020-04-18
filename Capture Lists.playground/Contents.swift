import UIKit

/*
    Swift Capture Lists
 */


var a = 0
var b = 0

// Design Closure

let newClosure = {print(a,b)}
newClosure()

// Design Closure Array

var closureArray: [() -> ()] = []
var i = 0

for _ in 1...5 {
    closureArray.append {
        print(i)
    }
    i += 1
}

i = 270


closureArray[0]()  // 5
i = 1
closureArray[1]()  // 5
closureArray[2]()  // 5
closureArray[3]()  // 5
closureArray[4]()  // 5

/*
 What is happening? Why are these five?
 Because, 'I' which is variable is a reference type. When closureArray is called at that time,
            'I' variable is 5.
*/


// Characteristic of Closure: Reference Type

var c = 0
var d = 0

let smartClosure: () -> () = { () in
    print(c, d)
}

smartClosure() // (0, 0)

c = 9
d = 9

smartClosure() // (9, 9)


/*
    Capture List
    Note: Don't Reference, Copy
 */

let smarterClosure: () -> () = { [c, d] in
    print(c, d)
}

smarterClosure() // (9, 9)

c = 10
d = 10

smarterClosure() // (9, 9)

/*
    Closures are like classes. If you don't want to make it as reference type, you have to do this.
        to put an array and add value that you want to store.
 */


//: Design Closure Array
var smartClosureArray: [() -> ()] = []
var j = 0

//: Appen Closure
for _ in 1...5 {
    smartClosureArray.append { [j] in
        print(j)
    }
    j += 1
}

smartClosureArray[0]()
smartClosureArray[1]()
smartClosureArray[2]()
smartClosureArray[3]()
smartClosureArray[4]()


// we used capture list and closure run like a value type instead of reference type.
