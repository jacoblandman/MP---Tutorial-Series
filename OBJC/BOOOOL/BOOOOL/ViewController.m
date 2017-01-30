//
//  ViewController.m
//  BOOOOL
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
    // Do any additional setup after loading the view, typically from a nib.
    
    BOOL amICool = YES;
    BOOL isTheOTherPersonCool = NO;
    
    if (amICool)
        NSLog(@"Whip out the cool Ray Bans and hit the beach!");
    else
        NSLog(@"We should never get here!");

    int var = 1;
    
    if ((55 == 22 && (amICool != isTheOTherPersonCool)) || var == 1) {
        
    }
    
    NSString *name = nil;
    
    if (name) {
        NSLog(@"Name: %@", name);
    } else if (100 == 100) {
        
    }
    
    if (!name) {
        name = @"Sandra";
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
