//
//  BannerView.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView

@property(nonatomic,strong)HomeBannerData *datamodel;

@property(nonatomic,strong)UIPageControl *pageCtrl;

@property(nonatomic,strong)UIScrollView *scroView;

- (void)createBannerView:(HomeBannerData *)model;
@end
