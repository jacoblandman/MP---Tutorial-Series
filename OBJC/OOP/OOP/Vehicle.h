//
//  Vehicle.h
//  OOP
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property(nonatomic, strong) NSString *make;
@property(nonatomic, strong) NSString *model;
@property(nonatomic, strong) NSString *engineSize;

- (void) drive;

@end
