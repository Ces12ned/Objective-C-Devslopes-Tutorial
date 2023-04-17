//
//  HTTPService.m
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 13/04/23.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+ (id) instance {
    
    static HTTPService *shareInstance = nil;
    
    @synchronized (self) {
        if (shareInstance == nil)
            shareInstance = [[self alloc] init];;
        
    }
    
    return shareInstance;
}

- (void) getTutorials:(nullable onComplete)completionHandler{

    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil){
            NSError *error;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            
            if (error == nil){
                completionHandler(json, nil);
            }else{
                completionHandler(nil, @"Data is corrupt. Please try again");
            }
        }else{
            NSLog(@"Network Error: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server");
        }
        
    }]
     resume
     ];
};


@end
