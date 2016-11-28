//
//  HomeCell.h
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/24.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell


@property(nonatomic,strong)HomeTopicDetail * homeModel;
+(HomeCell *)createHomeCellFor:(UITableView *)tableView Withmodel:(HomeTopicDetail *)model atIndexPath:(NSIndexPath *)indexPath;

@end
