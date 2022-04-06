//
//  VideoDataModel.h
//  MiniVideoTest
//
//  Created by roger on 2022/4/6.
//

#ifndef VideoDataModel_h
#define VideoDataModel_h

@interface VideoDataModel : NSObject

/**
 * 喜欢数
 */
@property (nonatomic ,strong) NSNumber* likeCount;
/**
 * 评论数
 */
@property (nonatomic ,strong) NSNumber* commentCount;
/**
 * 是否喜欢
 */
@property(nonatomic) BOOL likeStatus;
/**
 * 是否关注此用户
 */
@property(nonatomic) BOOL followStatus;
/**
 * 是否可以关注此用户
 */
@property(nonatomic) BOOL canFollow;
/**
 * 是否可以删除
 */
@property(nonatomic) BOOL canDelete;
/**
 * 视频URL
 */
@property (nonatomic ,strong) NSString* url;
/**
 * 视频封面URL
 */
@property (nonatomic ,strong) NSString* videoCover;
/**
 * 视频内容
 */
@property (nonatomic ,strong) NSString* content;
/**
 * 用户名
 */
@property (nonatomic ,strong) NSString* userName;
/**
 * 是否关注此用户
 */
@property (nonatomic ,strong) NSString* avatarUrl;

@end

#endif /* VideoDataModel_h */
