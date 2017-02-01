//
//  VideoCell.h
//  DevslopesTutorials
//
//  Created by Jacob Landman on 1/31/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
-(void) updateUI:(nonnull Video*)video;
@end
