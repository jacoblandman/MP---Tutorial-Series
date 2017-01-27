//
//  Person.m
//  Properties
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)test {
    self.firstName = @"Bob";
    
    _firstName = @"Jack";
    
    isInsecure = YES;
    
    [self setLastName:@"Davis"];
    
    NSString *name = [self firstName];
}

@end
