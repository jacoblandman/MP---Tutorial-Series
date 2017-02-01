//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Jacob Landman on 1/31/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSLog(@"Dictionary: %@", dataArray.debugDescription);
        } else if (errMessage) {
            
            // Display alert to user
        }
    }];
}



@end
