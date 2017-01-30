//
//  Person.h
//  BunchOfJunk
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Backpack;
@interface Person : NSObject

- (void) initData;
@property (nonatomic, strong) Backpack *backpack;

@end
