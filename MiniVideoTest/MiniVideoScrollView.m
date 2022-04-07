//
//  MiniVideoScrollView.m
//  MiniVideoTest
//
//  Created by roger on 2022/4/6.
//

#import <Foundation/Foundation.h>
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "UIImageView+WebCache.h"
#import "MiniVideoScrollView.h"
#import "MiniVideoItemView.h"
#import "VideoDataModel.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MiniVideoScrollView ()<UIScrollViewDelegate>

@property (strong, nonatomic) MiniVideoItemView *upperImageView;
@property (strong, nonatomic) MiniVideoItemView *middleImageView;
@property (strong, nonatomic) MiniVideoItemView *downImageView;

@property (nonatomic, strong) NSMutableArray * videos;
@property (nonatomic, strong) VideoDataModel * upperVideo, *middleVideo, *downVideo;
@property (nonatomic, strong) SJBaseVideoPlayer *upPerPlayer, *middlePlayer, *downPlayer;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MiniVideoScrollView

- (void)initVideos {
  self.videos = [[NSMutableArray alloc] init];


  VideoDataModel *model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/wewChXJTQk2f8AwhpDJF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/wewChXJTQk2f8AwhpDJF.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/XenMHxH2GGAd6BEAbEMj.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/XenMHxH2GGAd6BEAbEMj.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/jF8pyrdJEskfTf5kZPJF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/jF8pyrdJEskfTf5kZPJF.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/jW3mSxC7xrwfXA8rZDRR.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/jW3mSxC7xrwfXA8rZDRR.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220221/yZC6YQXM7ECacb6d3HNS.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220221/yZC6YQXM7ECacb6d3HNS.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220221/ed5ApMm2QT737YdpZXfF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220221/ed5ApMm2QT737YdpZXfF.mp4?vframe/jpg/offset/1";
  [ self.videos addObject:model ];

  self.currentIndex = 0;

  _upperVideo = (VideoDataModel *)_videos[_videos.count - 1];
  _middleVideo = (VideoDataModel *)_videos[_currentIndex];
  _downVideo = (VideoDataModel *)_videos[_currentIndex + 1];

  [self prepareForImageView:self.upperImageView withVideo:_upperVideo];
  [self prepareForImageView:self.middleImageView withVideo:_middleVideo];
  [self prepareForImageView:self.downImageView withVideo:_downVideo];
}

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

    self.upperImageView = [[MiniVideoItemView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.middleImageView = [[MiniVideoItemView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, frame.size.height)];
    self.downImageView = [[MiniVideoItemView alloc] initWithFrame:CGRectMake(0, frame.size.height*2, frame.size.width, frame.size.height)];
      
    //self.upperImageView.backgroundColor = [UIColor redColor];
    //self.middleImageView.backgroundColor = [UIColor greenColor];
    //self.downImageView.backgroundColor = [UIColor blueColor];
    
    _middlePlayer = SJBaseVideoPlayer.player;
    _upPerPlayer = SJBaseVideoPlayer.player;
    _downPlayer = SJBaseVideoPlayer.player;
    
    self.upPerPlayer.view.backgroundColor = [UIColor clearColor];
    self.upPerPlayer.view.tag = 10001;
    self.upPerPlayer.view.autoresizesSubviews = true;
    [self.upPerPlayer.view setFrame: self.bounds];  // player's frame must match parent's
    self.upPerPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.upPerPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.autoresizesSubviews = YES;
    
    self.middlePlayer.view.backgroundColor = [UIColor clearColor];
    self.middlePlayer.view.tag = 10002;
    self.middlePlayer.view.autoresizesSubviews = true;
    [self.middlePlayer.view setFrame: self.bounds];  // player's frame must match parent's
    self.middlePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.middlePlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 1, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.autoresizesSubviews = YES;
    
    self.downPlayer.view.backgroundColor = [UIColor clearColor];
    self.downPlayer.view.tag = 10003;
    self.downPlayer.view.autoresizesSubviews = true;
    [self.downPlayer.view setFrame: self.bounds];  // player's frame must match parent's
    self.downPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.downPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.autoresizesSubviews = YES;
    
    [self addSubview:_middlePlayer.view];
    [self addSubview:_upPerPlayer.view];
    [self addSubview:_downPlayer.view];
    [self addSubview:_upperImageView];
    [self addSubview:_middleImageView];
    [self addSubview:_downImageView];
    
    [self initVideos];
  
    [self _setupPlayer:_middlePlayer itemView:_middleImageView ];
    [self _setupPlayer:_upPerPlayer itemView:_upperImageView ];
    [self _setupPlayer:_downPlayer itemView:_downImageView ];
    
    [self prepareForVideo:self.upPerPlayer withVideo:_upperVideo];
    [self prepareForVideo:self.middlePlayer withVideo:_middleVideo play:YES];
    [self prepareForVideo:self.downPlayer withVideo:_downVideo];

  }
  
  return self;
}

//播放器相关初始化
- (void)_setupPlayer:(SJBaseVideoPlayer*)_player itemView:(MiniVideoItemView*)item {
  
  item.player = _player;
    
  _player.autoplayWhenSetNewAsset = NO;
  // 播放完毕后, 重新播放. 也就是循环播放
  _player.playbackObserver.playbackDidFinishExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
      [player replay];
  };
  __weak typeof(_player) _weakPlayer = _player;
  // 设置仅支持单击手势
  _player.gestureControl.supportedGestureTypes = SJPlayerGestureTypeMask_SingleTap;
  // 重定义单击手势的处理
  _player.gestureControl.singleTapHandler = ^(id<SJPlayerGestureControl>  _Nonnull control, CGPoint location) {
      // 此处改为单击暂停或播放
      _weakPlayer.isPaused ? [_weakPlayer play] : [_weakPlayer pauseForUser];
  };
  // 播放状态改变后刷新播放按钮显示状态
  __weak typeof(self) _self = self;
  _player.playbackObserver.playbackStatusDidChangeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
    __strong typeof(_self) self = _self;
    if ( !self ) return;
    [ item setPlayButtonVisible: _weakPlayer.isPaused ];
  };
}

//条目设置处理
- (void) prepareForImageView: (MiniVideoItemView *)itemView withVideo:(VideoDataModel *)video
{
  [itemView setImage:video.videoCover];
}
//视频设置处理
- (void) prepareForVideo: (SJBaseVideoPlayer *)player withVideo:(VideoDataModel *)video {
  [self prepareForVideo: player withVideo: video play:NO];
}
- (void) prepareForVideo: (SJBaseVideoPlayer *)player withVideo:(VideoDataModel *)video play:(BOOL)play
{
  [ player stop ];
  SJVideoPlayerURLAsset *asset = [SJVideoPlayerURLAsset.alloc initWithURL:[NSURL URLWithString:video.url]];
  player.URLAsset = asset;
  
  if (play) {
    [ player play ];
  }
}

//播放器的切换
- (void)switchPlayer:(UIScrollView*)scrollView
{
  CGFloat offset = scrollView.contentOffset.y;
  if (self.videos.count) {
    if (offset >= 2*self.frame.size.height)
    {
      // slides to the down player
      scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
      _currentIndex++;
      self.upperImageView.imageView.image = self.middleImageView.imageView.image;
      self.middleImageView.imageView.image = self.downImageView.imageView.image;

      if (self.upPerPlayer.view.frame.origin.y == 0) {
        self.upPerPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.upPerPlayer.view.frame = CGRectMake(0, self.upPerPlayer.view.frame.origin.y - SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
      
      if (self.middlePlayer.view.frame.origin.y == 0) {
        self.middlePlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.middlePlayer.view.frame = CGRectMake(0, self.middlePlayer.view.frame.origin.y - SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
      

      if (_currentIndex == self.videos.count - 1)
      {
        _downVideo = [self.videos firstObject];
      } else if (_currentIndex == self.videos.count)
      {
        _downVideo = self.videos[1];
        _currentIndex = 0;
        
      } else
      {
        _downVideo = self.videos[_currentIndex+1];
      }
      [self prepareForImageView: self.downImageView withVideo:_downVideo];
      
      if (self.downPlayer.view.frame.origin.y == 0) {
        self.downPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.downPlayer.view.frame = CGRectMake(0, self.downPlayer.view.frame.origin.y - SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
      
      if (self.upPerPlayer.view.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo:self.upPerPlayer withVideo:_downVideo];
      }
      if (self.middlePlayer.view.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo:self.middlePlayer withVideo:_downVideo];
      }
      if (self.downPlayer.view.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo:self.downPlayer withVideo:_downVideo];
      }
      
      NSLog(@"switchPlayer down %ld", _currentIndex);
    }
    else if (offset <= 0)
    {
      // slides to the upper player
      scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
      _currentIndex--;
      self.downImageView.imageView.image = self.middleImageView.imageView.image;

      if (self.downPlayer.view.frame.origin.y == 2 * SCREEN_HEIGHT) {
        self.downPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 0, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.downPlayer.view.frame = CGRectMake(0, self.downPlayer.view.frame.origin.y + SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
      
      self.middleImageView.imageView.image = self.upperImageView.imageView.image;

      
      if (self.middlePlayer.view.frame.origin.y == 2 * SCREEN_HEIGHT) {
        self.middlePlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 0, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.middlePlayer.view.frame = CGRectMake(0, self.middlePlayer.view.frame.origin.y + SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
     
      if (_currentIndex == 0)
      {
        _upperVideo = [self.videos lastObject];
        
      } else if (_currentIndex == -1)
      {
        _upperVideo = self.videos[self.videos.count - 2];
        _currentIndex = self.videos.count-1;
        
      } else
      {
        _upperVideo = self.videos[_currentIndex - 1];
      }
      [self prepareForImageView:self.upperImageView withVideo:_upperVideo];
      
      if (self.upPerPlayer.view.frame.origin.y == 2 * SCREEN_HEIGHT) {
        self.upPerPlayer.view.frame = CGRectMake(0, SCREEN_HEIGHT * 0, SCREEN_WIDTH, SCREEN_HEIGHT);
      }else{
        self.upPerPlayer.view.frame = CGRectMake(0, self.upPerPlayer.view.frame.origin.y + SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
      }
      
      if (self.upPerPlayer.view.frame.origin.y == 0 ) {
        [self prepareForVideo:self.upPerPlayer withVideo:_upperVideo];
      }
      if (self.middlePlayer.view.frame.origin.y == 0 ) {
        [self prepareForVideo:self.middlePlayer withVideo:_upperVideo];
      }
      if (self.downPlayer.view.frame.origin.y == 0 ) {
        [self prepareForVideo:self.downPlayer withVideo:_upperVideo];
      }
      
      NSLog(@"switchPlayer upper %ld", _currentIndex);
    }
  }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [self switchPlayer:scrollView];
}


@end
