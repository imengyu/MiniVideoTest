//
//  ViewController.m
//  MiniVideoTest
//
//  Created by roger on 2022/4/6.
//

#import "ViewController.h"
#import <SJVideoPlayer/SJVideoPlayer.h>
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *baseScroll;
@property (nonatomic, strong, readonly) SJVideoPlayer *player;

@end

@implementation ViewController

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _player = SJVideoPlayer.player;
    _player.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_player.view];
    [_player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.offset(0);
        make.top.bottom.equalTo(self.view).with.offset(0);
    }];
    
    _player.URLAsset = [SJVideoPlayerURLAsset.alloc initWithURL:[NSURL URLWithString:@"https://video.ydtapp.com/svd/file/20220324/zKkmJR6Bbf8ji7myDCdB.mp4"]];
    [_player controlLayerNeedAppear];
    
    self.baseScroll.backgroundColor = [UIColor redColor];
    [self.baseScroll setHidden:YES];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_player vc_viewDidAppear];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_player vc_viewWillDisappear];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_player vc_viewDidDisappear];
}

@end
