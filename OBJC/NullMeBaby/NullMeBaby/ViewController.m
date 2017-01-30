//
//  ViewController.m
//  NullMeBaby
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)updateName:(NSString* _Nullable)name {
    
}

- (int) sum:(nonnull NSNumber *)numA :(NSNumber* _Nonnull)numB {
    int theSum = numA.intValue + numB.intValue;
    return theSum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNumber *num1;
    NSNumber *num2;
    
    [self updateName:nil];
    
    int sum = [self sum:num1 :num2];
    //if (num1 && num2) {
    //    int sum = [self sum:num1 :num2];
    //    NSLog(@"Sum %d", sum);
    //} else
    //    NSLog(@"These are null");
    
}

@end
