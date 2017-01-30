//
//  ViewController.m
//  ArrayFun
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = [NSArray arrayWithObjects:@"My", @"mother", @"told", @"me", nil];
    NSString *str = @"Yay for Strings";
    NSArray *arr2 = @[@"donkey", @"kong", @"ate", @"your", @"mom"];
    
    arr2 = @[@"donkey", @"mom"];
    NSLog(@"Array2: %@", arr2.debugDescription);
    
    NSMutableArray *mut = [NSMutableArray arrayWithObjects:@"boom", @"jam", @"Slam", @"pam", nil];
    NSLog(@"MUT: %@", mut.debugDescription);
    [mut removeObjectAtIndex:2];
    [mut addObject:@"beast master"];
    NSLog(@"MUT: %@", mut.debugDescription);
    
    // initialize array with another array
    NSArray *arr3 = [NSArray arrayWithArray:arr];
    
    NSArray *arr4 = mut;
    
    NSMutableArray *mut2 = arr2;
}


@end
