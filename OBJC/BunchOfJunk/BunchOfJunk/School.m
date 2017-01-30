//
//  School.m
//  BunchOfJunk
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "School.h"
#import "Person.h"

@implementation School

- (void) initData {
    self.student = [[Person alloc]init];
    [self.student initData];
    
    // this dummy pulled a prank
    self.student = nil;
}

@end
