//
//  ViewController.m
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 11/04/23.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
        if (dataDict){
            NSLog(@"Dictionary: %@", dataDict.debugDescription);
        }else if (errorMessage){
            //Display alert to user
        }
    }];
        
}


@end
