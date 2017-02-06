//
//  XYZPerson+XYZPersonNameDisplayAdditions.m
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "XYZPerson+XYZPersonNameDisplayAdditions.h"

@implementation XYZPerson (XYZPersonNameDisplayAdditions)

- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end
