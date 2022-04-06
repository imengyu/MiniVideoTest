//
//  ViewController.m
//  MiniVideoTest
//
//  Created by roger on 2022/4/6.
//

#import "ViewController.h"
#import "MiniVideoScrollView.h"

@interface ViewController ()

@property (strong, nonatomic) MiniVideoScrollView *scroll;

@end

@implementation ViewController

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ViewController viewDidLoad");
    
    self.scroll = [[MiniVideoScrollView alloc] initWithFrame:self.view.frame ];
    [self.scroll setFrame:CGRectMake(0, 0, GZDeviceWidth, GZDeviceHeight)];
    
    [self.view addSubview:self.scroll];
}

@end
