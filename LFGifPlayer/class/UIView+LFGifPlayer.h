//
//  UIView+LFGifPlayer.h
//  LFGifPlayer
//
//  Created by TsanFeng Lam on 2018/5/2.
//  Copyright © 2018年 lincf0912. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LFGifPlayer)

@property (nonatomic, strong) NSData *lf_gifData;
@property (nonatomic, strong) UIImage *lf_gifFailImage;

- (void)lf_playGif;
- (void)lf_playGifOnce;
- (void)lf_stopGif;
- (BOOL)lf_isPlayGif;

@end
