//
//  ViewController.m
//  MethodMan
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic) double bankAccount;
@property (nonatomic) double itemAmount;
- (void)playground;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bankAccount = 500.50;
    self.itemAmount = 400;
    
    [self playground];
}

- (BOOL) canPurchase:(double)amount {
    
    if (self.bankAccount >= amount)
        return YES;
    
    return NO;
}

- (void) declareWinnerWithPlayerAScore:(NSInteger)scoreA playerBScore:(NSInteger)scoreB {
    
    if (scoreA > scoreB)
        NSLog(@"Player A Wins!");
    else if (scoreB > scoreA)
        NSLog(@"Player B Wins!");
    else
        NSLog(@"The game is at a standstill!!!!");
}

- (void) playground {
    
    if ([self canPurchase:self.itemAmount]) {
        NSLog(@"We can Buy!");
    }
    
    [self declareWinnerWithPlayerAScore:55 playerBScore:66];
 
    Person *person = [[Person alloc]init];
    [person speakName];
    [Person stateSpecies];
    
    // do it this way
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://google.com"]]];
    
    // dont do it this way
    NSString *urlString = @"http://google.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    image = [UIImage imageWithData:data];
}


@end
