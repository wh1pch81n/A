//
//  AA.m
//  A
//
//  Created by Ho, Derrick on 6/4/16.
//  Copyright © 2016 Ho, Derrick. All rights reserved.
//

#import "AA.h"
#import <A/A-Swift.h>

NSString *_DHLocalizedString(NSString *key, NSString *table, NSString *comment, Class sender);

NSString *DHLocalizedString(NSString *key, NSString *table, NSString *comment, NSObject *sender) {
	return NSLocalizedStringWithDefaultValue(key, table, [NSBundle mainBundle], _DHLocalizedString(key, table, comment, [sender class]), comment);
}

NSString *_DHLocalizedString(NSString *key, NSString *table, NSString *comment, Class sender) {
	NSLog(@"> %@", sender);
	return sender ? NSLocalizedStringWithDefaultValue(key, table, [NSBundle bundleForClass:sender], _DHLocalizedString(key, table, comment, [sender superclass]), comment) : @"";
}

@implementation AA
@synthesize sayIt = _sayIt;

- (void)AAA {
	NSLog(@"AAAA bemo!");
}
@end
