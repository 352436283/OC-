//
//  HomeModel.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class HomeData;
@protocol HomeTopicDetail;
@protocol HomeTopicPic;
@class HomeTopicUser;


@interface HomeModel : JSONModel


@property(nonatomic,strong)HomeData<Optional> *data;
@property(nonatomic,copy)NSString<Optional> *msg;
@property(nonatomic,copy)NSString<Optional> *status;
@property(nonatomic,strong)NSNumber<Optional> *ts;
@end

@interface HomeData : JSONModel

@property(nonatomic,strong)NSArray<Optional,HomeTopicDetail> *topic;

@end

@interface HomeTopicDetail : JSONModel

@property(nonatomic,copy)NSString<Optional> *comments;
@property(nonatomic,copy)NSString<Optional> *create_time_str;
@property(nonatomic,copy)NSString<Optional> *dateline;

@property(nonatomic,copy)NSString<Optional> *datestr;
@property(nonatomic,copy)NSString<Optional> *HomeTopicId;
@property(nonatomic,strong)NSNumber<Optional> *is_recommend;

@property(nonatomic,strong)NSNumber<Optional> *is_show_like;
@property(nonatomic,strong)NSNumber<Optional> *islike;
@property(nonatomic,copy)NSString<Optional> *items;

@property(nonatomic,copy)NSString<Optional> *likes;
@property(nonatomic,copy)NSString<Optional> *pic;
@property(nonatomic,strong)NSArray<Optional,HomeTopicPic> *pics;

@property(nonatomic,copy)NSString<Optional> *praises;
@property(nonatomic,copy)NSString<Optional> *title;
@property(nonatomic,copy)NSString<Optional> *type;
@property(nonatomic,copy)NSString<Optional> *type_id;
@property(nonatomic,copy)NSString<Optional> *update_time;

@property(nonatomic,strong)HomeTopicUser<Optional> *user;
@property(nonatomic,copy)NSString<Optional> *views;


@end


@interface HomeTopicPic : JSONModel

@property(nonatomic,copy)NSString *url;

@end

@interface HomeTopicUser : JSONModel

@property(nonatomic,copy)NSString<Optional> *article_topic_count;
@property(nonatomic,copy)NSString<Optional> *avatar;
@property(nonatomic,strong)NSNumber<Optional> *is_official;
@property(nonatomic,copy)NSString<Optional> *nickname;
@property(nonatomic,copy)NSString<Optional> *post_count;
@property(nonatomic,copy)NSString<Optional> *user_id;



@end


