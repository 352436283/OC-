//
//  TitleView.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/24.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

-(instancetype)initWithModel:(HomeBannerData *)model{

    if (self=[super init]){
    
        _bannerDataModel=model;
        self.backgroundColor=[UIColor whiteColor];
        self.showsHorizontalScrollIndicator=NO;
        NSInteger count=self.bannerDataModel.category_element.count;
        UIButton *lastBtn=nil;
        
        UIView *contentView=[[UIView alloc] init];
        
        [self addSubview: contentView];
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self);
            make.height.equalTo(self);
        }];

        for (NSInteger i=0;i<count;i++){
        
            UIButton *btn=[[UIButton alloc] init];
            HomeCategoryDetail *detailModel=self.bannerDataModel.category_element[i];
            _textLength=[detailModel.title length];
            btn.titleLabel.font=[UIFont systemFontOfSize:16];
            [btn setTitle:	detailModel.title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            btn.tag=100+i;
            btn.selected= (btn.tag==100) ?YES:NO;
            
            [contentView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.equalTo(self).offset(3);
                make.bottom.equalTo(self).offset(-3);
                make.width.mas_equalTo(self.textLength*18);
                if(lastBtn==nil){
                
                    make.left.equalTo(self).offset(5);
                }else{
                
                    make.left.equalTo(lastBtn.mas_right).offset(10);
                }
                
            }];
            lastBtn=btn;
            
        }
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(lastBtn);
        }];
    }
    for (UIButton* subView in self.subviews){
    
        
    }
    return self;
}

@end
