import UIKit


/*
    Completion Handlers
    Problem: I've heard about it. I don't know how to make one.
 */

/*
    Definition
    Note: Do something when something has been done
 */

/*
    Completion Handler Used?
    1- Notify the download has been completed
    2- Animation
 */


//: Practical UIKit Example

let firstVC = UIViewController()
let nextVC = UIViewController()


firstVC.present(nextVC, animated: true, completion: nil)
firstVC.present(nextVC, animated: true) {
    print("Done")
}

firstVC.present(nextVC, animated: true, completion: { print("Done")})
firstVC.present(nextVC, animated:  true) {print("Done")}


//: Design Handler Block
let myHandlerBlock: (Bool) -> () = { (isSuccess) in
    if isSuccess {
        print("Download has been done")
    }
}

let handlerBlock: (Bool) -> () = {
    if $0 {
        print("Download has been done")
    }
}

handlerBlock(true)
myHandlerBlock(true)


//: Design Function
func downloadImage(completionBlock: (Bool) ->Void) {
    for _ in 1...100 {
        print("Downloading")
    }
    completionBlock(true)
    // Animation
    // Pop Up
}

//: Pass Closure Indirectly
downloadImage(completionBlock: handlerBlock)

//: Pass Closure Directly
downloadImage(completionBlock: { (isSuccess) in
    print("Done")
})

downloadImage(completionBlock: {
    if $0 {
        print("Download has been done")
        // Animation
        // Pop Up
    }
})


//: Another Example
let handler: ([String]) -> () = { (array:[String]) -> Void in
    print("Done working, \(array)")
    
    // Compress the image
    // Add color
    // Resize
}

handler(["Samet", "iOS Developer", "Swift Fundamental"])

func workSuperHard(doneStuffBlock: ([String]) -> Void) {
    for _ in 1...100 {
        print("But you gotta put in 'run', 'run', 'run'")
        // download
    }
    doneStuffBlock(["image1", "image2", "image3"])
}

//: Enter Closure Indirectly
workSuperHard(doneStuffBlock: handler)


//: Enter Closure Directly
workSuperHard(doneStuffBlock: {(images: [String]) -> Void in
    print("Done working, \(images)")
    // Compress the image
    // Add color
    // Resize
})


/*
  If you need to do something after some objects have been downloaded or completed,
    you can use completion handler. this is perfect way to do that.
    closure syntax is not easy and learnig it can be very difficult. You should make practice.
 */
