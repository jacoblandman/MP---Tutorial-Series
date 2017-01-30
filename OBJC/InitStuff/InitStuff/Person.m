//
//  Person.m
//  InitStuff
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last {
    self = [super init];
    self.firstName = first;
    self.lastName = last;
    return self;
}

- (id)initWithAge:(NSInteger) age {
    
    self = [super init];
    return self;
}

- (void)printName {
    NSLog(@"%@ %@", self.firstName, self.lastName);
}

@end
