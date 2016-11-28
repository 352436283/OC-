//
//  HomeCell.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/24.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell()
@property (weak, nonatomic) IBOutlet UIImageView *topicImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@end
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHomeModel:(HomeTopicDetail *)homeModel{

    _homeModel=homeModel;
    [self.topicImageView sd_setImageWithURL: [NSURL URLWithString:self.homeModel.pic]];
    self.titleLabel.text=self.homeModel.title;
    self.likeLabel.text=self.homeModel.likes;
    
    
}

+(HomeCell *)createHomeCellFor:(UITableView *)tableView Withmodel:(HomeTopicDetail *)model atIndexPath:(NSIndexPath *)indexPath{

    NSString *cellId=@"homeCellId";
    HomeCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil==cell){
    
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:nil options:nil] lastObject];
        
    }
    cell.homeModel=model;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

@end
