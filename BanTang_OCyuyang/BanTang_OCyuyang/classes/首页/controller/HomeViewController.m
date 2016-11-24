//
//  HomeViewController.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerView.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)HomeBannerModel *bannermodel;
@property(nonatomic,strong)HomeModel *homemodel;
@property(nonatomic,strong)UICollectionView * collectionView;

@property(nonatomic,strong)BannerView *bannerView;


@end

@implementation HomeViewController

-(void)setBannermodel:(HomeBannerModel *)bannermodel{
    _bannermodel=bannermodel;
[self createUI];
    
}

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor yellowColor];
    [super viewDidLoad];
    [self download];
    
    
    
}

- (void)createUI{

    self.navigationController.navigationBar.alpha=0;
    self.automaticallyAdjustsScrollViewInsets=NO;
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc] init];
    //self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49) collectionViewLayout:flowlayout];
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowlayout.itemSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
    flowlayout.minimumLineSpacing=0;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    HomeBannerDetail *model=[self.bannermodel.data.banner firstObject];
    float width=model.photo_width.floatValue;
    float height=model.photo_height.floatValue;
    float viewHeight=([UIScreen mainScreen].bounds.size.width)*height/width;
    self.bannerView=[[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, viewHeight)];
    [self.bannerView createBannerView:self.bannermodel.data];
    [self.view addSubview:self.bannerView];
    
}

- (void)download{

    NSString *urlString=@"http://open3.bantangapp.com/recommend/operationElement?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=d9be3a583aed84017beac753cf74e44c&os_versions=10.1.1&screensize=1242&track_device_info=iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22";
    
    [BanTangDownloader downloadWithUrl:urlString success:^(NSData *data) {
        NSError *error = nil;
        HomeBannerModel *model=[[HomeBannerModel alloc] initWithData:data error:&error];
        if (error){
        
            NSLog(@"%@",error);
        }else{
        
            self.bannermodel=model;
            NSLog(@"%@",self.bannermodel);
            dispatch_async(dispatch_get_main_queue(),^{
            
                [self.collectionView reloadData];
            });
        }
    } fail:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
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

#pragma mark - UICollectionView的代理

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    return [[UICollectionViewCell alloc] init];
}

@end
