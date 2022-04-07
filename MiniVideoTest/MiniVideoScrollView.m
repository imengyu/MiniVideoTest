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
@property (nonatomic, strong) SJBaseVideoPlayer *currentPlayingPlayer;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MiniVideoScrollView

- (void)initVideos {
  self.videos = [[NSMutableArray alloc] init];


  VideoDataModel *model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/nFfmM4erRwFbYxYytHzN.mp4?vframe/jpg/offset/1";
  model.commentCount = @878;
  model.likeCount = @148759;
  model.likeStatus = YES;
  model.canFollow = YES;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220223/b26df81bea8dee051dcbef77ff94606d.jpg";
  model.userName = @"紫薇斗数-天佑";
  model.content = @"—悟  道—";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/wewChXJTQk2f8AwhpDJF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/wewChXJTQk2f8AwhpDJF.mp4?vframe/jpg/offset/1";
  model.commentCount = @77881;
  model.likeCount = @876;
  model.likeStatus = NO;
  model.canFollow = NO;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220328/36a9478af2f79b3d29d1fb8e02e5c0e7.jpg";
  model.userName = @"时斌";
  model.content = @"乾卦解读";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/XenMHxH2GGAd6BEAbEMj.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/XenMHxH2GGAd6BEAbEMj.mp4?vframe/jpg/offset/1";
  model.commentCount = @99479;
  model.likeCount = @543590;
  model.likeStatus = NO;
  model.canFollow = YES;
  model.avatarUrl = @"hhttps://image.ydtapp.com/usr/avatar/20220214/ece5110e6f99e2dd5882b635cd15a519.jpg";
  model.userName = @"廖相士";
  model.content = @"人有三光精气神";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/jF8pyrdJEskfTf5kZPJF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/jF8pyrdJEskfTf5kZPJF.mp4?vframe/jpg/offset/1";
  model.commentCount = @143;
  model.likeCount = @96436;
  model.likeStatus = NO;
  model.canFollow = YES;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220328/WkpmPYQpCjyBwJ25YBed.jpg";
  model.userName = @"清玄子";
  model.content = @"来式太极图";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220222/jW3mSxC7xrwfXA8rZDRR.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220222/jW3mSxC7xrwfXA8rZDRR.mp4?vframe/jpg/offset/1";
  model.commentCount = @33;
  model.likeCount = @16009;
  model.likeStatus = YES;
  model.canFollow = NO;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220223/b26df81bea8dee051dcbef77ff94606d.jpg";
  model.userName = @"清玄子";
  model.content = @"来式太极图";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220221/yZC6YQXM7ECacb6d3HNS.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220221/yZC6YQXM7ECacb6d3HNS.mp4?vframe/jpg/offset/1";
  model.commentCount = @988;
  model.likeCount = @88;
  model.likeStatus = NO;
  model.canFollow = NO;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220223/b26df81bea8dee051dcbef77ff94606d.jpg";
  model.userName = @"紫薇斗数-天佑";
  model.content = @"—悟  道—";
  [ self.videos addObject:model ];
  model = [[VideoDataModel alloc] init];
  model.url = @"https://video.ydtapp.com/svd/file/20220221/ed5ApMm2QT737YdpZXfF.mp4";
  model.videoCover = @"https://video.ydtapp.com/svd/file/20220221/ed5ApMm2QT737YdpZXfF.mp4?vframe/jpg/offset/1";
  model.commentCount = @2345;
  model.likeCount = @4487;
  model.likeStatus = YES;
  model.canFollow = YES;
  model.avatarUrl = @"https://image.ydtapp.com/usr/avatar/20220223/b26df81bea8dee051dcbef77ff94606d.jpg";
  model.userName = @"清玄子";
  model.content = @"来式太极图";
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
    
    _currentPlayingPlayer = _middlePlayer;
    [self _setupPlayer:_middlePlayer itemView:_middleImageView ];
    [self _setupPlayer:_upPerPlayer itemView:_upperImageView ];
    [self _setupPlayer:_downPlayer itemView:_downImageView ];
    
    [self prepareForVideo:self.upPerPlayer withVideo:_upperVideo];
    [self prepareForVideo:self.middlePlayer withVideo:_middleVideo];
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
  // 缓冲完毕后，如果是当前播放器，则开始播放
  _player.playbackObserver.assetStatusDidChangeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
    if(player.assetStatus == SJAssetStatusReadyToPlay && player == self.currentPlayingPlayer) {
      NSLog(@"Play when SJAssetStatusReadyToPlay");
      [ player play ];
    }
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
  _player.playbackObserver.timeControlStatusDidChangeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
    [ item setPlayButtonVisible: _weakPlayer.timeControlStatus == SJPlaybackTimeControlStatusPaused ];
  };
}

//条目设置处理
- (void) prepareForImageView: (MiniVideoItemView *)itemView withVideo:(VideoDataModel *)video
{
  [itemView setItemData:video];
}
//视频设置处理
- (void) prepareForVideo: (SJBaseVideoPlayer *)player withVideo:(VideoDataModel *)video
{
  [ player stop ];
  SJVideoPlayerURLAsset *asset = [SJVideoPlayerURLAsset.alloc initWithURL:[NSURL URLWithString:video.url]];
  player.URLAsset = asset;
}

- (void)movePlayerViewUp:(UIView*)view {
  if (view.frame.origin.y == 0) {
    view.frame = CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT);
  } else {
    view.frame = CGRectMake(0, view.frame.origin.y - SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
  }
}
- (void)movePlayerViewDown:(UIView*)view {
  if (view.frame.origin.y == 2 * SCREEN_HEIGHT) {
    view.frame = CGRectMake(0, SCREEN_HEIGHT * 0, SCREEN_WIDTH, SCREEN_HEIGHT);
  }else{
    view.frame = CGRectMake(0, view.frame.origin.y + SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
  }
}

//播放器的切换
- (void)switchPlayer:(UIScrollView*)scrollView
{
  CGFloat offset = scrollView.contentOffset.y;
  if (self.videos.count) {
    if (offset >= 2 * self.frame.size.height)
    {
      //这是往下滑
      scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
      _currentIndex++;
      
      //需要先停止正在播放的上一个播放器
      if (_currentPlayingPlayer) {
        NSLog(@"Pause prev _currentPlayingPlayer");
         [_currentPlayingPlayer pause];
      }
      
      //把下一页的图片层移动到当前页
      [ self movePlayerViewUp:self.upperImageView ];
      [ self movePlayerViewUp:self.middleImageView ];
      [ self movePlayerViewUp:self.downImageView ];
      //然后把播放器全部往上移一格
      [ self movePlayerViewUp:self.upPerPlayer.view ];
      [ self movePlayerViewUp:self.middlePlayer.view ];
      [ self movePlayerViewUp:self.downPlayer.view ];
      
      //设置下一个视频，如果到达末尾，则从头视频开始
      if (_currentIndex == self.videos.count - 1)
      {
        _downVideo = [self.videos firstObject];
      }
      else if (_currentIndex == self.videos.count)
      {
        _downVideo = self.videos[1];
        _currentIndex = 0;
      }
      else
      {
        _downVideo = self.videos[_currentIndex+1];
      }
      
      
      //获取处于最下面的播放器，开始缓冲视频
      //获取处于中间的播放器，开始播放视频
      if (_upperImageView.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo:_upPerPlayer withVideo:_downVideo];
        _currentPlayingPlayer = _downPlayer;
        
        //设置下一页的图片与数据
        [self prepareForImageView: _upperImageView withVideo:_downVideo];
      }
      if (_middleImageView.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo:_middlePlayer withVideo:_downVideo];
        _currentPlayingPlayer = _upPerPlayer;
        
        //设置下一页的图片与数据
        [self prepareForImageView: _middleImageView withVideo:_downVideo];
      }
      if (_downImageView.frame.origin.y == SCREEN_HEIGHT * 2) {
        [self prepareForVideo: _downPlayer withVideo:_downVideo];
        _currentPlayingPlayer = _middlePlayer;
        
        //设置下一页的图片与数据
        [self prepareForImageView: _downImageView withVideo:_downVideo];
      }
      if (_currentPlayingPlayer)
        [_currentPlayingPlayer play];
      
      NSLog(@"switchPlayer down %ld", _currentIndex);
    }
    else if (offset <= 0)
    {
      //这是往上滑
      scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
      _currentIndex--;
      self.downImageView.imageView.image = self.middleImageView.imageView.image;

      //需要先停止正在播放的上一个播放器
      if (_currentPlayingPlayer) {
        NSLog(@"Pause prev _currentPlayingPlayer");
         [_currentPlayingPlayer pause];
      }
      
      //把上一页的图片层移动到当前页
      [ self movePlayerViewDown:self.upperImageView ];
      [ self movePlayerViewDown:self.middleImageView ];
      [ self movePlayerViewDown:self.downImageView ];
      //然后把播放器全部往下移一格
      [ self movePlayerViewDown:self.upPerPlayer.view ];
      [ self movePlayerViewDown:self.middlePlayer.view ];
      [ self movePlayerViewDown:self.downPlayer.view ];
      
      //设置上一个视频，如果到达第一个，则从尾视频开始
      if (_currentIndex == 0)
      {
        _upperVideo = [self.videos lastObject];
      }
      else if (_currentIndex == -1)
      {
        _upperVideo = self.videos[self.videos.count - 2];
        _currentIndex = self.videos.count - 1;
      }
      else
      {
        _upperVideo = self.videos[_currentIndex - 1];
      }
      
      //获取处于最上面的播放器，开始缓冲视频
      //获取处于中间的播放器，开始播放视频
      if (_upperImageView.frame.origin.y == 0) {
        [self prepareForVideo:_upPerPlayer withVideo:_upperVideo];
        _currentPlayingPlayer = _middlePlayer;
        
        //设置上一页的图片与数据
        [self prepareForImageView: _upperImageView withVideo:_upperVideo];
      }
      if (_middleImageView.frame.origin.y == 0) {
        [self prepareForVideo:_middlePlayer withVideo:_upperVideo];
        _currentPlayingPlayer = _downPlayer;
        
        //设置上一页的图片与数据
        [self prepareForImageView: _middleImageView withVideo:_upperVideo];
      }
      if (_downImageView.frame.origin.y == 0) {
        [self prepareForVideo: _downPlayer withVideo:_upperVideo];
        _currentPlayingPlayer = _upPerPlayer;
        
        //设置上一页的图片与数据
        [self prepareForImageView: _downImageView withVideo:_upperVideo];
      }
      if (_currentPlayingPlayer)
        [_currentPlayingPlayer play];
      
      NSLog(@"switchPlayer upper %ld", _currentIndex);
    }
  }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [self switchPlayer:scrollView];
}


@end
