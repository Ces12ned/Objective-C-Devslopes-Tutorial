//
//  VideoCell.m
//  DevslopesTutorial
//
//  Created by Edgar Cisneros on 14/04/23.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@end

@implementation VideoCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
    
    
}

-(void)updateUI: (nonnull Video*)video{
    
    self.titleLabel.text = video.videoTitle;
    self.descriptionLabel.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:video.thumbnailURL]]];
    
    self.thumbnailImage.image = image;
    
}




@end
