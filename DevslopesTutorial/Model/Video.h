//
//  Video.h
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 17/04/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (nonatomic,strong) NSString *videoTitle;
@property (nonatomic,strong) NSString *videoDescription;
@property (nonatomic,strong) NSString *videoIframe;
@property (nonatomic,strong) NSString *thumbnailURL;

@end

NS_ASSUME_NONNULL_END
