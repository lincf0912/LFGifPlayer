//
//  UIView+LFGifPlayer.m
//  LFGifPlayer
//
//  Created by TsanFeng Lam on 2018/5/2.
//  Copyright © 2018年 lincf0912. All rights reserved.
//

#import "UIView+LFGifPlayer.h"
#import "LFGifPlayerManager.h"
#import "objc/runtime.h"

static char LFGifDataKey;
static char LFGifFailImageKey;

@implementation UIView (LFGifPlayer)

- (NSData *)lf_gifData
{
    return objc_getAssociatedObject(self, &LFGifDataKey);
}

- (void)setLf_gifData:(NSData *)lf_gifData
{
    objc_setAssociatedObject(self, &LFGifDataKey, lf_gifData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)lf_gifFailImage
{
    return objc_getAssociatedObject(self, &LFGifFailImageKey);
}

- (void)setLf_gifFailImage:(UIImage *)lf_gifFailImage
{
    objc_setAssociatedObject(self, &LFGifFailImageKey, lf_gifFailImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lf_playGif
{
    __weak typeof(self) weakSelf = self;
    NSString *p = [NSString stringWithFormat:@"%p", self];

    [[LFGifPlayerManager shared] transformGifDataToSampBufferRef:weakSelf.lf_gifData key:p execution:^(CGImageRef imageData, NSString *key) {
        if ([p isEqualToString:key]) {
            weakSelf.layer.contents = (__bridge id _Nullable)(imageData);
        }
    } fail:^(NSString *key) {
        if ([p isEqualToString:key]) {
            weakSelf.layer.contents = (__bridge id _Nullable)(weakSelf.lf_gifFailImage.CGImage);
        }
    }];
}

- (void)lf_playGifOnce
{
    __weak typeof(self) weakSelf = self;
    NSString *p = [NSString stringWithFormat:@"%p", self];
    
    [[LFGifPlayerManager shared] transformOnceGifDataToSampBufferRef:weakSelf.lf_gifData key:p execution:^(CGImageRef imageData, NSString *key) {
        if ([p isEqualToString:key]) {
            weakSelf.layer.contents = (__bridge id _Nullable)(imageData);
        }
    } fail:^(NSString *key) {
        if ([p isEqualToString:key]) {
            weakSelf.layer.contents = (__bridge id _Nullable)(weakSelf.lf_gifFailImage.CGImage);
        }
    }];
}

- (void)lf_stopGif
{
    NSString *p = [NSString stringWithFormat:@"%p", self];
    [[LFGifPlayerManager shared] stopGIFWithKey:p];
}
- (BOOL)lf_isPlayGif
{
    NSString *p = [NSString stringWithFormat:@"%p", self];
    return [[LFGifPlayerManager shared] isGIFPlaying:p];
}

@end
