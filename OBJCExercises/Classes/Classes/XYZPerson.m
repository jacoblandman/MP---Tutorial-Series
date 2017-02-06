//
//  XYZPerson.m
//  Classes
//
//  Created by Jacob Landman on 2/6/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "XYZPerson.h"
#import "XYZPerson+XYZPersonNameDisplayAdditions.h"


@interface XYZPerson ()

@property NSNumber *weight;
@property NSNumber *height;

@end

@implementation XYZPerson

- (void)sayHello {
    [self saySomething:[NSString stringWithFormat:@"Hello %@ %@", self.firstName, self.lastName]];
}

- (void)sayGoodBye {
    [self saySomething:@"Good Bye!"];
}

- (void)saySomething:(NSString *)greeting {
    NSLog(@"%@", greeting);
}

- (id)initWithFirstName:(NSMutableString *)firstName LastName:(NSString *)lastName DateOfBirth:(NSDate *) dateOfBirth {
    
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _dateOfBirth = dateOfBirth;
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"Deallocating person object");
}

- (id)init {
    self = [super init];
    
    if (self) {
        _firstName = [[NSMutableString alloc] init];
        _lastName = [[NSMutableString alloc] init];
        _dateOfBirth = [[NSDate alloc] init];
    }
    
    return self;
}

- (void) printLastNameFirstName {
    NSString *string = [self lastNameFirstNameString];
    NSLog(@"%@", string);
}

- (void) measureHeight:(NSNumber *)height {
    _height = height;
}

- (void) measureWeight:(NSNumber *)weight {
    _weight = weight;
}

+ (id)person {
    return [[self alloc] initWithFirstName:[NSMutableString stringWithString:@"Jacob"] LastName:@"Landman" DateOfBirth:[NSDate date]];
}



@end
