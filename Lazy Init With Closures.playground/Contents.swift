import UIKit


/*
    Lazy Init With Closures
    Problem: How to initialize an object  with a closure?
 */

//: Unconventional Way
let box: UIView = {
    let view = UIView()
    return view
}()

//: Create UI Components
let btnSize = CGRect(x: 0, y: 0, width: 100, height: 100)

// ViewControllerOne
let fristBtn = UIButton(frame: btnSize)
fristBtn.backgroundColor = .blue
fristBtn.titleLabel?.text = "Samet"
fristBtn.titleLabel?.textColor = .white

// ViewControllerTwo
let secondBtn = UIButton(frame: btnSize)
secondBtn.backgroundColor = .green
secondBtn.titleLabel?.text = "iOS Developer"
secondBtn.titleLabel?.textColor = .white

//: Create Button With Function
func createButton(enterTitle: String) ->  UIButton {
    let customButton = UIButton(frame: btnSize)
    customButton.backgroundColor = .blue
    customButton.titleLabel?.text = enterTitle
    customButton.titleLabel?.textColor = .white
    return customButton
}

createButton(enterTitle: "Samet")
 
//: Introducing Unconventional Way
struct Human {
    init() {
        print("Born 1989")
    }
}

let createSamet = { () -> Human in
    let human = Human()
    return human
}()

//: Create UIView Unconvetionally
let customView = { () -> UIView in
    let view = UIView()
    view.backgroundColor = .orange
    return view
}()

let customViewTwo = { () -> UIView in
    let view = UIView()
    view.backgroundColor = .black
    return view
}()

let customThree: UIView = { () -> UIView in
    let view = UIView()
    view.backgroundColor = .black
    return view
}()

//: Create UIView Unconventionally by taking parameter
let customizeView = { (backgroundColor: UIColor) -> UIView in
    let view = UIView()
    view.backgroundColor = backgroundColor
    return view
}

let view = customizeView(.black)
let viewController = {() -> UIViewController in
    let viewController = UIViewController()
    viewController.view = view
    return viewController
}

let customizeViewTwo: ((UIColor) -> UIView) = { (color: UIColor) -> UIView in
    let view = UIView()
    view.backgroundColor = color
    return view
}

let viewTwo = customizeViewTwo(.blue)


/*
    Lazy Var
    Problem: Why do we use lazy var?
 */

class IntenseMathProblem {
   lazy var complexNumber: Int = {
         return 1 * 1
    }()
}

let problem = IntenseMathProblem() // no value for complexNumber yet
problem.complexNumber   // now, complexNumber exists, is 1

class SortFromDataBase {
    // Data
    lazy var sortNumberFromDatabase: [Int] = {
        // calculation and sorting
        return [1,9,0,6,3,7,4,0,5,10,11,8].sorted()
    }()
}

let object = SortFromDataBase() // sortNumberFromDatabase does not exist yet in memory.
object.sortNumberFromDatabase   // when I write this row at this time, this variable exists in memory anymore.

class CompressionManager {
    lazy var compressedImage: UIImage = {
        let image = UIImage()
        // Compress the image
        // Logic
        return image
    }()
}


/*
    Lazy Rules
    1- You can't use lazy with let since there is no initial value, and it is attained later when it is accessed.
    2- You can't use lazy with a 'Commputed Property' since computed property is always recalculated (requires CPU) when
       you modify any of the variables htat has a relationship with the lazy property.
    3- Lazy is only valid for members of a struct or class
 */

