//
//  ViewController.m
//  ClassAnatomy
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
// this is where you define local variables only accesbile by this claass
@property (nonatomic, strong) NSString *vehicle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Name: %@", self.name);
    
    self.name = @"Jack";
    
    NSLog(@"Name: %@", self.name);
    
    _name = @"Peter";
    
    NSLog(@"Name: %@", _name);
    
    NSLog(@"Name: %@", self.name);
    
    [self setName:@"Sylvia"];
    
    NSLog(@"Name: %@", [self name]);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
