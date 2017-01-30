//
//  Honda.h
//  Categories
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Honda : NSObject

@property(nonatomic, strong) NSString *model;
@property(nonatomic, strong) NSNumber *miles;

- (void)increaseMilesToOdometer;
- (void)drive;

@end
