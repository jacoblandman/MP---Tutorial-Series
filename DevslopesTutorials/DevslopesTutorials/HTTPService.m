//
//  HTTPService.m
//  DevslopesTutorials
//
//  Created by Jacob Landman on 1/31/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id) instance {
    // because of the static keyword, only one will live in memory
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}


@end
