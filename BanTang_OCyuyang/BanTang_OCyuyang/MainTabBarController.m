//
//  MainTabBarController.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()



@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
    // Do any additional setup after loading the view.
}

- (void)createViewControllers{
    NSArray *ctrlNameArray=[NSArray arrayWithObjects:@"HomeViewController",@"DiscoverViewController",@"MessageViewController",@"ProfileViewController",nil];
    NSArray *imageArray=[NSArray arrayWithObjects:@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_friendTrends_icon",@"tabBar_me_icon", nil];
    NSArray *name=[NSArray arrayWithObjects:@"首页",@"发现",@"消息",@"我的", nil];
    NSMutableArray *navArray=[NSMutableArray array];

    for (int i=0;i<ctrlNameArray.count;i++){
        NSString *str=ctrlNameArray[i];
        NSString *imageName=imageArray[i];
        NSString *title=name[i];
        Class cls=NSClassFromString(str);
        UIViewController *ctrl=[[cls alloc] init];
        ctrl.tabBarItem.title=title;
        ctrl.tabBarItem.image=[UIImage imageNamed:imageName];
        UINavigationController *navCtrl=[[UINavigationController alloc] initWithRootViewController:ctrl];
    
        [navArray addObject:navCtrl];
    }
    self.viewControllers=navArray;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
