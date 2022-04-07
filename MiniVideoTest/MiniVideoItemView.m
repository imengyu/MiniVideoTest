//
//  MiniVideoItemView.m
//  MiniVideoTest
//
//  Created by roger on 2022/4/7.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"
#import "MiniVideoItemView.h"

@interface MiniVideoItemView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *playImageView;

@end

@implementation MiniVideoItemView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.autoresizesSubviews = YES;
    self.clipsToBounds = NO;
    
    //初始化xlb并添加到视图
    MiniVideoItemView* view = [[[NSBundle mainBundle] loadNibNamed:@"MiniVideoItemView" owner:self options:nil] firstObject];
    view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self addSubview:view];
    self.likeButtonImage = view.likeButtonImage;
    self.likeButtonLabel = view.likeButtonLabel;
    self.commentButtonImage = view.commentButtonImage;
    self.commentButtonLabel = view.commentButtonLabel;
    self.shareButtonImage = view.shareButtonImage;
    self.userHeadImage = view.userHeadImage;
    self.followButtonImage = view.followButtonImage;
    self.userLabel = view.userLabel;
    self.contentLabel = view.contentLabel;
    
    [self.userHeadImage.layer setCornerRadius:CGRectGetHeight([self.userHeadImage bounds]) / 2];
    [self.userHeadImage.layer setMasksToBounds:YES];
    
    //加载一下背景图
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit ;
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    _playImageView = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"play"]];
    _playImageView.hidden = NO;
    _playImageView.contentMode = UIViewContentModeScaleToFill;
    _playImageView.clipsToBounds = YES;
    [self addSubview:_playImageView];
    [_playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center.offset(0);
      make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
  }
  return self;
}

//点击事件穿透
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if(hitView == self){
        return nil;
    }
    return hitView;
}

//类似抖音数字过大转为多少多少w
- (NSString*)getLargeNumberString:(NSNumber*)num {
  if([num longValue] < 10000) return num.description;
  else {
    float w = [num longValue] / 10000.0f;
    return [ NSString stringWithFormat:@"%.1fw",w ];
  }
}

//设置数据
- (void)setPlayButtonVisible:(BOOL)visible {
  self.playImageView.hidden = !visible;
}
- (void)setItemData:(VideoDataModel*)data {
  
  [self.likeButtonLabel setText: [self getLargeNumberString:data.likeCount ] ];
  [self.commentButtonLabel setText: [self getLargeNumberString:data.commentCount  ]];
  [self.contentLabel setText: data.content ];
  [self.userLabel setText: [ @"@" stringByAppendingString:data.userName ] ];
  self.followButtonImage.hidden = !data.canFollow;
  
  if(data.followStatus) {
    self.followButtonImage.image = [ UIImage imageNamed:@"unfollow_button" ];
  } else {
    self.followButtonImage.image = [ UIImage imageNamed:@"follow_button" ];
  }
  
  if(data.likeStatus) {
    self.likeButtonImage.image = [ UIImage imageNamed:@"unlike_button" ];
  } else {
    self.likeButtonImage.image = [ UIImage imageNamed:@"like_button" ];
  }
  
  [self.userHeadImage sd_setImageWithURL:[NSURL URLWithString:data.avatarUrl]];
  [_player.presentView.placeholderImageView sd_setImageWithURL:[NSURL URLWithString:data.videoCover]];
}

@end
