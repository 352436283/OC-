//
//  BannerView.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()

@end
@implementation BannerView

- (void)createBannerView:(HomeBannerData *)model{

    self.datamodel=model;
    HomeBannerDetail *lastbannerModel=self.datamodel.banner[self.datamodel.banner.count-1];
    float width=lastbannerModel.photo_width.floatValue;
    float height=lastbannerModel.photo_height.floatValue;
    float viewHeight=([UIScreen mainScreen].bounds.size.width)*height/width;
    self.scroView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewHeight)];
    self.scroView.scrollEnabled=YES;
    self.scroView.pagingEnabled=YES;
    
    [self addSubview:self.scroView];
    self.backgroundColor=[UIColor whiteColor];
    
    UIImageView *lastImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewHeight)];
    
    [lastImageView sd_setImageWithURL:[NSURL URLWithString:lastbannerModel.photo]];
    
    [self.scroView addSubview:lastImageView];
    
    UIImageView *firstImageView=[[UIImageView alloc] initWithFrame:CGRectMake((self.datamodel.banner.count+1)*([UIScreen mainScreen].bounds.size.width), 0, [UIScreen mainScreen].bounds.size.width, viewHeight)];
    HomeBannerDetail *firstbannerModel=self.datamodel.banner[0];
    [firstImageView sd_setImageWithURL:[NSURL URLWithString:firstbannerModel.photo]];
    [self.scroView addSubview:firstImageView];
    
    for (NSInteger index=0;index<self.datamodel.banner.count;index++){
        HomeBannerDetail *bannerModel=self.datamodel.banner[index];
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)*(index+1), 0, [UIScreen mainScreen].bounds.size.width, viewHeight)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:bannerModel.photo]];
        [self.scroView addSubview:imageView];
        
    }
    
    self.scroView.contentSize=CGSizeMake((self.datamodel.banner.count+2)*[UIScreen mainScreen].bounds.size.width, 0);
    self.scroView.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    self.scroView.backgroundColor=[UIColor redColor];
    
    
}

- (void)createUI{

    
    
    
    
//    self.pageCtrl.numberOfPages=self.datamodel.banner.count;
//    self.pageCtrl.frame=CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 6);
//    self.pageCtrl.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, self.pageCtrl.center.y);
//    self.pageCtrl.currentPage=0;
//    self.pageCtrl.tintColor=[UIColor redColor];
//    self.pageCtrl.currentPageIndicatorTintColor=[UIColor blackColor];
//    [self.scroView addSubview:self.pageCtrl];
}


@end
