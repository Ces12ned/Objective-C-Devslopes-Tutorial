//
//  HTTPService.m
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 13/04/23.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id) instance {
    
    static HTTPService *shareInstance = nil;
    
    @synchronized (self) {
        if (shareInstance == nil)
            shareInstance = [[self alloc] init];;
        
    }
    
    return shareInstance;
}


@end
