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

- (void)setPlayButtonVisible:(BOOL)visible {
  self.playImageView.hidden = !visible;
}
- (void)setImage:(NSString*)imageUrl {
  [_player.presentView.placeholderImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

@end
