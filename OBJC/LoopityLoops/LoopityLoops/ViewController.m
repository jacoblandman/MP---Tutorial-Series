//
//  ViewController.m
//  LoopityLoops
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
    
    NSArray *cars = @[@"Bimmer", @"maserati", @"bronco"];
    
    // C for loop
    for (int x = 0; x < cars.count ; x++) {
        NSString *car = [cars objectAtIndex: x];
        NSLog(@"Car: %@", car);
    }
    
    // fast enumeration loop
    for (NSString *car in cars) {
        NSLog(@"Car: %@", car);
    }
    
    
}


@end
