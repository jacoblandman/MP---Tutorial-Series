//
//  Person.h
//  InitStuff
//
//  Created by Jacob Landman on 1/30/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, strong) NSString *lastName;
- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last;
- (void)printName;
@end
