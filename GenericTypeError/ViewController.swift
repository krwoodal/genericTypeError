//
//  ViewController.swift
//  GenericTypeError
//
//  Created by Kristopher Woodall on 4/10/20.
//  Copyright © 2020 Remind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var modelFactory: ObjectPresenter<ViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let value: RealmInt = 1.asNSNumber
        self.modelFactory = ObjectPresenter(realm:  RealmUtility.sharedInstance().realm, primaryKeyValue: value)
        
        // Fix for compile error Segmentation Fault
//        self.modelFactory = ObjectPresenter(realm:  RealmUtility.sharedInstance().realm, primaryKeyValue: value.asNSNumber)
    }
}

extension ViewController: RealmObjectViewModelConsumer {
    func consumeNewViewModel(_ model: ViewModel) {
       
    }
    
    func monitoredRealmModelWasInvalidated() {
      
    }
}

class ExampleObject: RLMObject {}

struct ViewModel: RealmObjectViewModel {
    let realmObject: ExampleObject
    
    init(realmObject: ExampleObject) {
        self.realmObject = realmObject
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

protocol RealmObjectViewModel {
    associatedtype Model: RLMObject
    
    init(realmObject: Model)
}

protocol RealmObjectViewModelConsumer: class {
    associatedtype ViewModel: RealmObjectViewModel
    
    func consumeNewViewModel(_ model: ViewModel)
    func monitoredRealmModelWasInvalidated()
}

class ObjectPresenter<ConsumerClass: RealmObjectViewModelConsumer> {
    typealias Object = ConsumerClass.ViewModel.Model
    typealias ViewModel = ConsumerClass.ViewModel
    
    let realm: RLMRealm
    private var monitoredResults: RLMResults<RLMObject>?
    
    init(realm: RLMRealm, primaryKeyValue: CVarArg) {
        self.realm = realm
        
        if let primaryKey = Object.primaryKey() {
            self.monitoredResults = Object.objects(in: realm, where: "SELF.%K == %@", args: getVaList([ primaryKey, primaryKeyValue ]))
        }
    }
}
