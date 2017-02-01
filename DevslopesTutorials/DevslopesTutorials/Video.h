//
//  Video.h
//  DevslopesTutorials
//
//  Created by Jacob Landman on 1/31/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
// these should be protected using data encapsulation with getters and setters
@property(nonatomic, strong) NSString *videoTitle;
@property(nonatomic, strong) NSString *videoDescription;
@property(nonatomic, strong) NSString *videoIframe;
@property(nonatomic, strong) NSString *thumbnailUrl;

@end
