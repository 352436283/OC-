//
//  TitleView.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/24.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIScrollView

@property(nonatomic,strong)HomeBannerData * bannerDataModel;
@property(nonatomic,assign)NSInteger textLength;

-(instancetype)initWithModel:(HomeBannerData*) model;

@end
