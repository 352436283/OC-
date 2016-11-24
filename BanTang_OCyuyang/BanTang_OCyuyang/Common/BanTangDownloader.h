//
//  BanTangDownloader.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BanTangDownloader : NSObject

+ (void)downloadWithUrl:(NSString *)urlString success:(void(^)(NSData *data))finishBlock fail:(void(^)(NSError *error))failBlock;

@end
