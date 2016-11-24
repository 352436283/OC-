//
//  HomeBannerModel.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeBannerData;
@protocol HomeBannerDetail;
@protocol HomeCategoryDetail;

@interface HomeBannerModel : JSONModel

@property(nonatomic,strong)HomeBannerData<Optional> *data;
@property(nonatomic,copy)NSString<Optional> *msg;
@property(nonatomic,copy)NSString<Optional> *status;
@property(nonatomic,strong)NSNumber<Optional> *ts;

@end

@interface HomeBannerData : JSONModel

@property(nonatomic,strong)NSArray<Optional,HomeBannerDetail> *banner;
@property(nonatomic,strong)NSArray<Optional,HomeCategoryDetail> *category_element;


@end

@interface HomeBannerDetail : JSONModel

@property(nonatomic,copy)NSString<Optional> *extend;
@property(nonatomic,copy)NSString<Optional> *bannerDetailId;
@property(nonatomic,strong)NSNumber<Optional> *index;

@property(nonatomic,strong)NSNumber<Optional> *is_show_icon;
@property(nonatomic,copy)NSString<Optional> *parent_id;
@property(nonatomic,copy)NSString<Optional> *photo;

@property(nonatomic,copy)NSString<Optional> *photo_height;
@property(nonatomic,copy)NSString<Optional> *photo_width;
@property(nonatomic,copy)NSString<Optional> *sub_title;

@property(nonatomic,copy)NSString<Optional> *title;
@property(nonatomic,copy)NSString<Optional> *topic_type;
@property(nonatomic,copy)NSString<Optional> *type;
@end


@interface HomeCategoryDetail : JSONModel

@property(nonatomic,copy)NSString<Optional> *extend;
@property(nonatomic,copy)NSString<Optional> *categoryDetailId;
@property(nonatomic,copy)NSString<Optional> *title;
@property(nonatomic,copy)NSString<Optional> *type;


@end








