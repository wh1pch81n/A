//
//  DHLocalizedString.swift
//  A
//
//  Created by Derrick  Ho on 6/9/16.
//  Copyright © 2016 Ho, Derrick. All rights reserved.
//

/**
original macro.  Should probably switch to a recursive solution going from the bottom up.
#define DHLocalizedString(KEY, TABLE, COMMENT) NSLocalizedStringWithDefaultValue(KEY, TABLE, [NSBundle mainBundle], NSLocalizedStringWithDefaultValue(KEY, TABLE, [NSBundle bundleForClass:[self class]]), COMMENT)
*/

import Foundation

func getNameByRemovingPrefixPathAndExtension(name: String) -> String {
	let url = NSURL(string: name)!
	let className = url.URLByDeletingPathExtension!.lastPathComponent!
	return className
}
func objectifySwiftSelector(sel: String) -> Selector {
	return NSSelectorFromString(sel.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "()_")).reduce("", combine: +))
}
func objectifySwiftSelector(sel: Selector) -> Selector {
	return objectifySwiftSelector(NSStringFromSelector(sel))
}
public func DHLocalizedStringFromTable(key: String, table: String, comment: String?, file: String = #file, funcName: String = #function) -> String {
	let className = getNameByRemovingPrefixPathAndExtension(file)
	for fw in NSBundle.allFrameworks() {
		let frameworkName = getNameByRemovingPrefixPathAndExtension(fw.bundlePath)
		//print("\(frameworkName).\(className)")
		guard let cls = NSClassFromString("\(frameworkName).\(className)") else {
			continue
		}
		print(cls)
		let cls2 = (cls as! NSObject.Type).init()
		guard cls2.respondsToSelector(objectifySwiftSelector(funcName)) else {
			continue
		}
		// class found and function that called it is a part of that class
		let bundleOfClass = NSBundle(forClass: cls)
		let frameworkLocalizedString = NSLocalizedString(key, tableName: table, bundle: bundleOfClass, value: key, comment: comment ?? "")
		return NSLocalizedString(key, tableName: table, bundle: NSBundle.mainBundle(), value: frameworkLocalizedString, comment: comment ?? "")
	}
	return key
}