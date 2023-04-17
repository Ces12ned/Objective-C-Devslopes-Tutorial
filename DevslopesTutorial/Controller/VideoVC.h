//
//  VideoVC.h
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 17/04/23.
//

#import <UIKit/UIKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoVC : UIViewController <UIWebViewDelegate>

@property (nonatomic,strong) Video *video;

@end

NS_ASSUME_NONNULL_END
