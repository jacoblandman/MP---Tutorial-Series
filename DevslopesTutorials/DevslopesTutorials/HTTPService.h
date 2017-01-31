//
//  HTTPService.h
//  DevslopesTutorials
//
//  Created by Jacob Landman on 1/31/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void  (^onComplete)(NSDictionary * __nullable dataDict, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (nonnull id) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
