import Foundation
import Signpost
import os

class Example {
    let signposter = OSSignposter()
    
    func sayHello() {
        #signpost
        print("Hello!")
    }
}

let example = Example()
example.sayHello()
