//
//  VideoCell.h
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 14/04/23.
//

#import <UIKit/UIKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UITableViewCell

-(void)updateUI: (nonnull Video*)video;


@end

NS_ASSUME_NONNULL_END
