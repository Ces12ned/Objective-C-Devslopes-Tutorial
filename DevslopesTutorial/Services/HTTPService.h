//
//  HTTPService.h
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 13/04/23.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSDictionary * __nullable dataDict, NSString *__nullable errorMessage);  //Defining a new type

NS_ASSUME_NONNULL_BEGIN

@interface HTTPService : NSObject

+ (id) instance;

- (void) getTutorials:(nullable onComplete)completionHandler;



@end

NS_ASSUME_NONNULL_END
