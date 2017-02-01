//
//  VideoVC.h
//  DevslopesTutorials
//
//  Created by Jacob Landman on 2/1/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;
@end
