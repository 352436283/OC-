//
//  BanTangDownloader.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BanTangDownloader.h"


@implementation BanTangDownloader

+(void)downloadWithUrl:(NSString *)urlString success:(void (^)(NSData *))finishBlock fail:(void (^)(NSError *))failBlock{

    NSURL *url=[NSURL URLWithString:urlString];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    
   AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSURLSessionDataTask *task=[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if(error){
        
            failBlock(error);
        }else{
        
            NSHTTPURLResponse *r=(NSHTTPURLResponse *)response;
            if(r.statusCode==200){
            
                finishBlock(responseObject);
            }else{
            
                NSError *e=[NSError errorWithDomain:urlString code:r.statusCode userInfo:@{@"msg":@"下载失败"}];
                failBlock(e);
            }
        }
        
    }];
    
    [task resume];
    
    
    
}

@end
