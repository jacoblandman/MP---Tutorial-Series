//
//  ViewController.m
//  InitStuff
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // this is more explicit
    // it allocates and initializes
    Person *person = [[Person alloc]init];
    
    [person printName];
    // this does the same thing, but just calls the defaul initializer
    //Person *person2 = [Person new];
    
    Person *person3 = [[Person alloc]initWithFirstName:@"Jacob" lastName:@"Landman"];
    [person3 printName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
