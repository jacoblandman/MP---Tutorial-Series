//
//  ViewController.m
//  GettersSetters
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"
#import "Vehicle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Vehicle *car = [[Vehicle alloc] init];
    
    car.odometer = -100;
    
    NSLog(@"Odometer: %lu", car.odometer);
    
    car.model = @"Honda Civic";
    
    NSLog(@"I drive a: %@", car.model);
    
}

@end
