//
//  ViewController.m
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableString *name = [NSMutableString stringWithString:@"Jacob"];
    XYZPerson *person = [XYZPerson new];
    [person sayHello];
    person.firstName = name;
    [person sayHello];
    
    [name setString:@"Jack" ];
    [person sayHello];
    
    XYZPerson *person2 = person;
    
    person = nil;
    person2 = nil;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
