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
    
    XYZPerson *person = [XYZPerson new];
    [person sayHello];
    person.firstName = [NSMutableString stringWithString:@"Jacob"];
    [person sayHello];
    [person printLastNameFirstName];
    
    XYZPerson *person2 = person;
    
    person = nil;
    person2 = nil;
    
    UIFont *font = [UIFont fontWithName:@"Palatino-Roman" size:14.0];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjects:
                                @[font, [UIColor blackColor]]
                                                           forKeys:
                                @[NSFontAttributeName, NSForegroundColorAttributeName]];
    
    NSString *newString = @"hello";
    
    [newString drawInRect:self.accessibilityFrame withAttributes:attributes];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
