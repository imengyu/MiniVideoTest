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

@interface MiniVideoItemView : UIView

- (void)setPlayButtonVisible:(BOOL)visible;
- (void)setImage:(NSString*)imageUrl;

@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) SJBaseVideoPlayer *player;

@end

#endif /* Header_h */
