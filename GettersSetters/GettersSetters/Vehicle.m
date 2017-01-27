//
//  Vehicle.m
//  GettersSetters
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

- (void)setOdometer:(long)odometer {
    if (odometer > _odometer) {
        // set the instance variable so that it has the updated value
        _odometer = odometer;
    }
}

- (NSString*)model {
    if ([_model isEqualToString:@"Honda Civic"]) {
        return @"POS";
    } else {
        return _model;
    }
}

@end
