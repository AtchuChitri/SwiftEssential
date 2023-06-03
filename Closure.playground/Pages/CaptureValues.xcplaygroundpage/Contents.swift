//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

// Best way to handle Capture values

//https://www.objc.io/blog/2018/04/03/caputure-lists/

//https://www.swiftbysundell.com/articles/capturing-objects-in-swift-closures/#capturing-the-context-instead-of-self

//https://medium.com/@almalehdev/you-dont-always-need-weak-self-a778bec505ef#:~:text=Escaping%20closures%20require%20%5Bweak%20self,bad%20depending%20on%20your%20intentions



//capturing values in closure
class Present {
  var closure: (() -> Void)?
    var type: String = ""
    var workItem:DispatchWorkItem?
    
    init() {
    }
    
    func leakyDispatchQueue() {
        let workItem = DispatchWorkItem { self.type = "Value" }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: workItem)
        print("leakyDispatchQueue")
        self.workItem = workItem // stored in a property
        
        //why here a leak because workItem will be finish after some time and meanwhile holding self object what if self want to deallocate eargly then closure
        // How do solve here
        // we can either write notify and write [weak self] access workItem as optional
        
//        workItem.notify(queue: .main) { [weak self] in
//            self?.workItem = workItem
//        }
        
        // Or add local varibale on top access that
//        var strongWorkItem = self.workItem
//
//        strongWorkItem = workItem
    }
    
    func nonLeakyDispatchQueue() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.type = "Value"
        }

        DispatchQueue.main.async {
            self.type = "Value"
        }

        DispatchQueue.global(qos: .background).async {
            self.type = "Value"
        }
    }
    
    func withEscaping(completion:@escaping (String) -> Void) {
        print("Escaping Start")
        DispatchQueue.main.asyncAfter(deadline: .now()  + 0.30) {
            print("Escaping after 30 sec")
            completion("BaseVC")
        }
        print("Escaping End")
    }
    
    deinit {
        print("All Cleared Present")
    }
}

var p:Present? = Present()
p?.leakyDispatchQueue()
p = nil

class PresentedController: UIViewController {
  var closure: (() -> Void)?
}
class MainViewController: UIViewController {
  
  var presented = PresentedController()

  func setupClosure() {
    presented.closure = printer
  }
    
    // break reatin cycle
    func setupClosure1() {
      self.presented.closure = { [weak self] in
        self?.printer()
      }
    }

  func printer() {
    print(self.view.description)
  }
    
    deinit {
        print("All Cleared PresentedController")
    }
}

var mainVC:MainViewController?  = MainViewController()
mainVC?.setupClosure()
mainVC = nil
