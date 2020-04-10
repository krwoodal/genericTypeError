import UIKit

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let value: RealmInt = 1.asNSNumber
        doStuff(primaryKeyValue: value)
        
        // Fix for compile error Segmentation Fault
//        doStuff(primaryKeyValue: value.asNSNumber)
    }
    
    func doStuff(primaryKeyValue: CVarArg) {
        print(primaryKeyValue)
    }
}

public extension Int {
    var asNSNumber: NSNumber {
        return NSNumber(value: self)
    }
}

extension NSNumber {
    public var asNSNumber: NSNumber {
        return self
    }
}
