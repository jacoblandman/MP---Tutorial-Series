//
//  Person.h
//  Properties
//
//  Created by Jacob Landman on 1/26/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    // define instance variables here
    // these are private
    
    BOOL isInsecure;
}

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end
