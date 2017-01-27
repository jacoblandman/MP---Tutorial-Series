//
//  ViewController.m
//  StringFling
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // string literal
    NSString *firstName = @"John";
    // in contrast to
    NSString *lastName = [[NSString alloc]init];
    lastName = @"Snow";
    
    NSLog(@"Name: %@ %@", firstName, lastName);
    
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    NSString *display = [fullName stringByAppendingString:@" - Died 1448"];
    
    NSLog(@"%@",display);
    
    NSLog(@"Full Name: %@", fullName);
    
    NSString *var1 = @"Junk";
    NSString *var2 = @"in the trunk";
    NSString *var3 = @"junk";
    
    if ([var1.lowercaseString isEqualToString:var3]) {
        NSLog(@"They are the same");
    } else {
        NSLog(@"They are different");
    }
    
    if ([var1 caseInsensitiveCompare: var3] == NSOrderedSame) {
        NSLog(@"Woohoo");
    }
}

@end
