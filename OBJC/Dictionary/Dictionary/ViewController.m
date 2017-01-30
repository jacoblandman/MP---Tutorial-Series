//
//  ViewController.m
//  Dictionary
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
    
    NSNumber *age = [NSNumber numberWithInt:40];
    NSNumber *age2 = [NSNumber numberWithInt:34];
    
    // this is bad practive, but you can mix data types
    //NSDictionary *dict = @{@"jack": age, @"jon": age2, @"peter": @"parker"};
    
    NSDictionary *dict = @{@"jack": age, @"jon": age2};
    
    int jacksAge = [[dict objectForKey:@"jack"] intValue];
    NSLog(@"Jacks age: %d", jacksAge);
    
    // literal syntax grabs a regular deictionary,
    // then you have to call the mutable copy function
    NSMutableDictionary *mut = [@{@"1": @"BMW", @"2": @"Volvo", @"3": @"Ugly Honda Civic"} mutableCopy];
    
    // the better way to do it
    NSMutableDictionary *mut2 = [[NSMutableDictionary alloc]init];
    
    [mut2 setObject:@"An Object" forKey:@"A key"];
    [mut2 setObject:@"An Object 2" forKey:@"A second key"];
    
}


@end
