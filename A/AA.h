//
//  AA.h
//  A
//
//  Created by Ho, Derrick on 6/4/16.
//  Copyright © 2016 Ho, Derrick. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *DHLocalizedString(NSString *key, NSString *table, NSString *comment, NSObject *sender);

@protocol ei
@property (nonatomic, strong, readonly) NSString *sayIt;
//-(void)swiftGuts;
@end

@interface AA : UIViewController<ei>
- (void)AAA;
//- (void)swiftGuts;
@end
