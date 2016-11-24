//
//  HomeBannerModel.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeBannerModel.h"

@implementation HomeBannerModel

@end

@implementation HomeBannerData


@end

@implementation HomeBannerDetail

+(JSONKeyMapper *)keyMapper{

    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"bannerDetailId":@"id"}];
}
@end

@implementation HomeCategoryDetail

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"categoryDetailId":@"id"}];
}

@end