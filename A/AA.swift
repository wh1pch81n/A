//
//  AA.swift
//  A
//
//  Created by Derrick  Ho on 6/8/16.
//  Copyright © 2016 Ho, Derrick. All rights reserved.
//

//public protocol ei {
//	var sayIt: String { get }
//}

public extension NSObject {
	public subscript (key: String) -> AnyObject? {
		get {
			return valueForKey(key)
		}
		set {
			setValue(newValue, forKey: key)
		}
	}
	
}

extension AA {
	public func thisIsASwiftMethod() {
		print("This is a Swift method extending an objective-c class")
		print("kudos")
	}
	public override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		print("viewdidappear on the swift side of the moon")
	}
	
	public func sayIt() -> String? {
		return self["_sayIt"] as! String?
		//return valueForKey("_sayIt") as! String?
	}
	public func setSayIt(s: String?) {
		self["_sayIt"] = s
		//setValue(s, forKey: "_sayIt")
	}
}
