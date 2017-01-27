//
//  ViewController.m
//  MountainMath
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
    
    
    int imAnInt = 5;
    float iAmAFloat = 3.3;
    double iAmTheDouble = 5.666664;
    
    NSLog(@"Int: %d", imAnInt);
    NSLog(@"Float: %f", iAmAFloat);
    NSLog(@"Double: %f", iAmTheDouble);
    
    // store things in nsnumber
    NSNumber *numInt = [NSNumber numberWithInt:5];
    NSNumber *numInt2 = [NSNumber numberWithInt:6];
    
    // if doing operations, grab the values out of NSNumber
    int val = numInt.intValue;
    int val2 = numInt2.intValue;
    
    int sum = val + val2;
    
    NSLog(@"Sum: %d", sum);
    
    NSNumber *numSum = [NSNumber numberWithInt:sum];
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects: numInt, numInt2, numSum, nil];
    
    NSNumber *valNum = [NSNumber numberWithDouble:5.63334];
    
    NSString *str = numSum.stringValue;
    
    [arr addObject:valNum];
    
    NSInteger someInt = 55;
    
    NSLog(@"Array count: %lu", (unsigned long)arr.count);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
