//
//  XYZPerson.h
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject <NSCopying>

@property(nonatomic, copy) NSMutableString *firstName;
@property(nonatomic) NSString *lastName;
@property(nonatomic) NSDate *dateOfBirth;
@property(readonly) NSNumber *weight;
@property(readonly) NSNumber *height;

- (void)saySomething: (NSString *)greeting;
- (void)sayHello;
- (void)sayGoodBye;
- (void) printLastNameFirstName;
- (id)initWithFirstName:(NSMutableString *)firstName LastName:(NSString *)lastName DateOfBirth:(NSDate *) dateOfBirth;
- (void) measureWeight:(NSNumber *)height ;
- (void) measureHeight:(NSNumber *)weight ;
+ (id)person;
- (void) dealloc;

@end
