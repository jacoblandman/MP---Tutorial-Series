//
//  XYZShoutingPerson.m
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "XYZShoutingPerson.h"

@implementation XYZShoutingPerson

- (void)saySomething:(NSString *)greeting {
    
    [super saySomething:greeting.uppercaseString];
}

@end
