//
//  Person.m
//  BunchOfJunk
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "Person.h"
#import "Backpack.h"

@implementation Person

- (void)initData {
    self.backpack = [[Backpack alloc]init];
    self.backpack.owner = self;
}

@end
