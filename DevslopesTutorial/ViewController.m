//
//  ViewController.m
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 11/04/23.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errorMessage) {
        if (dataArray){
            
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            
            for (NSDictionary *d in dataArray){
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [d objectForKey:@"title"];
                vid.videoDescription = [d objectForKey: @"description"];
                vid.videoIframe = [d objectForKey:@"iframe"];
                vid.thumbnailURL = [d objectForKey:@"thumbnail"];
                
                
                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableData];
           
        }else if (errorMessage){
            //Display alert to user
        }
    }];
        
}


-(void) updateTableData{
    dispatch_async(dispatch_get_main_queue() , ^{
        [self.tableView reloadData];
    });
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
    
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    VideoCell *cell = (VideoCell*) [tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if (!cell){
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.videoList.count;
}

@end
