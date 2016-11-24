//
//  HomeModel.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

@end

@implementation HomeData


@end

@implementation HomeTopicDetail

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"HomeTopicId":@"id"}];
}

@end

@implementation HomeTopicPic


@end

@implementation HomeTopicUser


@end