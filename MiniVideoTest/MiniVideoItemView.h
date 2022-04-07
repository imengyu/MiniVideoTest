//
//  Header.h
//  MiniVideoTest
//
//  Created by roger on 2022/4/7.
//

#ifndef Header_h
#define Header_h

#import <UIKit/UIKit.h>
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "VideoDataModel.h"

@interface MiniVideoItemView : UIView

- (void)setPlayButtonVisible:(BOOL)visible;
- (void)setItemData:(VideoDataModel*)data ;

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) SJBaseVideoPlayer *player;

@property (strong, nonatomic) IBOutlet UIImageView *likeButtonImage;
@property (strong, nonatomic) IBOutlet UILabel *likeButtonLabel;

@property (strong, nonatomic) IBOutlet UIImageView *commentButtonImage;
@property (strong, nonatomic) IBOutlet UILabel *commentButtonLabel;

@property (strong, nonatomic) IBOutlet UIImageView *shareButtonImage;

@property (strong, nonatomic) IBOutlet UIImageView *userHeadImage;
@property (strong, nonatomic) IBOutlet UIImageView *followButtonImage;

@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end

#endif /* Header_h */
