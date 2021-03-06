//
//  GifUtils.h
//  MEMobile
//
//  Created by LamTsanFeng on 16/9/14.
//  Copyright © 2016年 GZMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>

typedef void (^GifExecution) (CGImageRef imageData, NSString *key);
typedef void (^GifFail) (NSString *key);

FOUNDATION_EXPORT NSRunLoopMode const NSDefaultRunLoopMode;
FOUNDATION_EXPORT NSRunLoopMode const NSRunLoopCommonModes;

@interface LFGifPlayerManager : NSObject

+ (LFGifPlayerManager *)shared;
/** 释放 */
+ (void)free;

/** 模式 default is NSRunLoopCommonModes */
@property (nonatomic, copy) NSRunLoopMode currentMode;

/** 停止播放 */
- (void)stopGIFWithKey:(NSString *)key;
/** 是否播放 */
- (BOOL)isGIFPlaying:(NSString *)key;

/**
 *  @author lincf, 16-09-14 14:09:21
 *
 *  播放gif
 *
 *  @param gifPath        文件路径
 *  @param key            gif标记
 *  @param executionBlock 成功回调 循环回调 gif的每一帧
 *  @param failBlock      失败回调 一次
 */
- (void)transformGifPathToSampBufferRef:(NSString *)gifPath key:(NSString *)key execution:(GifExecution)executionBlock fail:(GifFail)failBlock;

/**
 *  @author lincf, 16-09-14 14:09:41
 *
 *  播放gif
 *
 *  @param gifData        文件数据
 *  @param key            gif标记
 *  @param executionBlock 成功回调 循环回调 gif的每一帧
 *  @param failBlock      失败回调 一次
 */
- (void)transformGifDataToSampBufferRef:(NSData *)gifData key:(NSString *)key execution:(GifExecution)executionBlock fail:(GifFail)failBlock;


/**
 播放gif(限制次数)

 @param gifData 文件数据
 @param key gif标记
 @param executionBlock 成功回调
 @param failBlock 失败回调
 */
- (void)transformGifDataToSampBufferRef:(NSData *)gifData key:(NSString *)key loopCount:(NSUInteger)loopCount execution:(GifExecution)executionBlock fail:(GifFail)failBlock;
@end
