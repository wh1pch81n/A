//
//  Cool.swift
//  A
//
//  Created by Derrick  Ho on 6/9/16.
//  Copyright © 2016 Ho, Derrick. All rights reserved.
//

import Foundation
@objc
public class Cool: NSObject {
	@objc public func magic(blah: String, fff: String) {
		print(DHLocalizedStringFromTable("keyblade", table: "kingdomhearts", comment: nil))
	}
}

