//
//  NSString+Category.m
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (AddedCategory)

- (void) drawUpperCaseAtPoint:(CGPoint)point withAttributes: (NSDictionary *)attributes {
    NSString *upper = self.uppercaseString;
    
    [upper drawAtPoint:point withAttributes:attributes];
}

@end
