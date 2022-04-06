//
//  MiniVideoScrollView.m
//  MiniVideoTest
//
//  Created by roger on 2022/4/6.
//

#import <Foundation/Foundation.h>
#import "MiniVideoScrollView.h"

@interface MiniVideoScrollView ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *upperImageView;
@property (strong, nonatomic) UIImageView *middleImageView;
@property (strong, nonatomic) UIImageView *downImageView;

@end

@implementation MiniVideoScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
      NSLog(@"MiniVideoScrollView initWithFrame");
      
    self.contentSize = CGSizeMake(0, frame.size.height * 3);
    self.contentOffset = CGPointMake(0, frame.size.height);
    self.pagingEnabled = YES;
    self.opaque = YES;
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.clipsToBounds = NO;
    self.delegate = self;
    self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    self.upperImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, frame.size.height)];
    self.downImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height*2, frame.size.width, frame.size.height)];
      
    self.upperImageView.backgroundColor = [UIColor redColor];
    self.middleImageView.backgroundColor = [UIColor greenColor];
    self.downImageView.backgroundColor = [UIColor blueColor];
      
    [self addSubview:self.upperImageView];
    [self addSubview:self.middleImageView];
    [self addSubview:self.downImageView];
    
  }
  return self;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  
}


@end
