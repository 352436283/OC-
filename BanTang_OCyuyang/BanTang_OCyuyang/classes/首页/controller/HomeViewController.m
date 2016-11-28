//
//  HomeViewController.m
//  BanTang_OCyuyang
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerView.h"
#import "TitleView.h"
#import "HomeCell.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)HomeBannerModel *bannermodel;
@property(nonatomic,strong)HomeModel *homemodel;
@property(nonatomic,strong)UICollectionView * collectionView;

@property(nonatomic,strong)BannerView *bannerView;
@property(nonatomic,strong)TitleView *titleView;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,strong)NSMutableArray<HomeModel *> *array;
@property(nonatomic,strong)HomeData* dataModel;
@property(nonatomic,assign)NSInteger viewHeight;
@property(nonatomic,strong)UITableView *tbView;

//标签数量
@property(nonatomic,assign)NSInteger titleNumber;


@end

@implementation HomeViewController

-(void)setBannermodel:(HomeBannerModel *)bannermodel{
    _bannermodel=bannermodel;
    
    HomeBannerDetail *model=[self.bannermodel.data.banner firstObject];
    float width=model.photo_width.floatValue;
    float height=model.photo_height.floatValue;
    float viewHeight=([UIScreen mainScreen].bounds.size.width)*height/width;
    self.viewHeight=viewHeight;

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
    flowlayout.scrollDirection=UILayoutConstraintAxisHorizontal;
    flowlayout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    flowlayout.minimumLineSpacing=0;
    flowlayout.minimumInteritemSpacing=0;
    
    
    
    
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, self.viewHeight+36, self.view.frame.size.width, self.view.frame.size.height-64-49) collectionViewLayout:flowlayout];
    self.collectionView.backgroundColor=[UIColor blackColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    self.collectionView.contentSize=CGSizeMake(self.view.frame.size.width*13, 0);
    self.collectionView.bounces=false;
    self.collectionView.pagingEnabled=YES;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
    
   
    
    
    
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowlayout.itemSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
    flowlayout.minimumLineSpacing=0;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    
    self.bannerView=[[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.viewHeight)];
    [self.bannerView createBannerView:self.bannermodel.data];
    [self.view addSubview:self.bannerView];
    
    self.titleView=[[TitleView alloc] initWithModel:self.bannermodel.data];
    self.titleView.frame=CGRectMake(0, self.viewHeight, self.view.frame.size.width, 36);
    [self.view addSubview:self.titleView];
    
   
}



- (void)download{
    

    NSString *urlString=@"http://open3.bantangapp.com/recommend/operationElement?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=d9be3a583aed84017beac753cf74e44c&os_versions=10.1.1&screensize=1242&track_device_info=iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22";
    
    [BanTangDownloader downloadWithUrl:urlString success:^(NSData *data) {
        NSError *error = nil;
        HomeBannerModel *model=[[HomeBannerModel alloc] initWithData:data error:&error];
        if (error){
        
            //NSLog(@"%@",error);
        }else{
        
            self.bannermodel=model;
            self.titleNumber=self.bannermodel.data.category_element.count;
            
            
            for (NSInteger i=0;i<self.titleNumber;i++){
                
                
                HomeCategoryDetail *model1 = self.bannermodel.data.category_element[i];
                NSString *typeString=model1.type;
                NSString *extendString=model1.extend;
                NSString *titleSting=@"";
                if ([typeString isEqualToString:@"topic_main"]){
                    
                    titleSting=@"http://open3.bantangapp.com/recommend/index?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&isfromhome=1&last_get_time=1479348965&oauth_token=d9be3a583aed84017beac753cf74e44c&os_versions=10.1.1&page=0&pagesize=20&screensize=1242&track_device_info=iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22";
                    
                }else if([typeString isEqualToString:@"topic_user_rec_article_list"]){
                    
                    titleSting=@"http://open3.bantangapp.com/recommend/userRecommendArticleList?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&isfromhome=1&oauth_token=f567021309529ccb01acad5ee29a5031&os_versions=10.1.1&page=0&pagesize=20&screensize=1242&track_device_info=iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22";
                    
                }else if([typeString isEqualToString:@"topic_list"]){
                    
                    
                    NSArray *array=[extendString componentsSeparatedByString:@","];
                    NSString *string1=@"";
                    for (int i=0;i<array.count;i++){
                        
                        NSString *numString=array[i];
                        NSString *appendString=@"";
                        if(i != array.count-1){
                            
                            appendString=[numString stringByAppendingString:@"%2C"];
                        }else{
                            
                            appendString=numString;
                        }
                        string1=[string1 stringByAppendingString:appendString];
                        
                    }
                    
                    
                    
                    titleSting=[NSString stringWithFormat:@"http://open3.bantangapp.com/topics/topic/listByIds?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&ids=%@&isfromhome=1&oauth_token=d9be3a583aed84017beac753cf74e44c&os_versions=10.1.1&page=0&pagesize=20&screensize=1242&track_device_info=",string1];
                    titleSting=[titleSting stringByAppendingString:@"iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22"];
                    
                    
                    
                }else if([typeString isEqualToString:@"topic_list_by_attribute"]){
                    
                    titleSting=[NSString stringWithFormat:@"http://open3.bantangapp.com/topics/topic/listByAttribute?app_id=com.jzyd.BanTang&app_installtime=1479348523&app_versions=5.9.2&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&ids=%@&isfromhome=1&oauth_token=d9be3a583aed84017beac753cf74e44c&os_versions=10.1.1&page=0&pagesize=20&screensize=1242&track_device_info=",extendString];
                    titleSting=[titleSting stringByAppendingString:@"iPhone9%2C2&track_device_uuid=8A4D2F80-7E8C-47C9-B9AA-95F96E1148C2&track_deviceid=97D603EA-EC1B-4DEB-B3B6-1DBAF5CBEBCE&track_user_id=2726232&v=22"];
                    
                    
                }
                
                //NSLog(@"%@",titleSting);
                //NSLog(@"==========");
                
                
                
                [BanTangDownloader downloadWithUrl:titleSting success:^(NSData *data) {
                    NSError *error = nil;
                    
                    HomeModel *model=[[HomeModel alloc] initWithData:data error:&error];
                    
                    

                    
                    if (error){
                        
                         NSLog(@"%@",error);
                    }else{
                        
                        
                        self.array=[[NSMutableArray alloc] init];
                        [self.array addObject:model];
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(),^{
                            
                            [self.tbView reloadData];
                        });
                    }
                } fail:^(NSError *error) {
                    
                    NSLog(@"%@",error);
                }];
                
                
                
            }

            dispatch_async(dispatch_get_main_queue(),^{
                
                [self.collectionView reloadData];
            });

            
           
        }
    } fail:^(NSError *error) {
        
        //NSLog(@"%@",error);
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

    return 13;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellID=@"cellId";
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    for (UIView* tmpView in cell.contentView.subviews){
    
        [tmpView removeFromSuperview];
        
    }
    self.currentIndex=indexPath.row;
    //NSLog(@"%ld",self.currentIndex);
    self.tbView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStylePlain];
    self.tbView.backgroundColor=[UIColor whiteColor];
    [self.tbView reloadData];
    self.tbView.delegate=self;
    self.tbView.dataSource=self;
    [cell.contentView addSubview:self.tbView];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsZero;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if(scrollView==self.collectionView){
    
        if(self.bannerView.frame.origin.y==-240+64){
        
            self.navigationController.navigationBar.alpha=1;
        }else if(self.bannerView.frame.origin.y==0){
        
            self.navigationController.navigationBar.alpha=0;
        }
        if(self.bannerView.frame.origin.y>-(self.viewHeight+36)+64 && self.collectionView.contentOffset.y>0){
        
            if(scrollView.contentOffset.y/43<1){
            
                self.navigationController.navigationBar.alpha=scrollView.contentOffset.y/43;
            }
            
        }
    }
}

#pragma mark - UITableView的代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    self.dataModel=self.array[self.currentIndex].data;
    //NSLog(@"%ld",self.array.count);
    return self.dataModel.topic.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 240;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    HomeTopicDetail *model=self.dataModel.topic[indexPath.row];
    
    
    HomeCell *cell=[HomeCell createHomeCellFor:tableView Withmodel:model atIndexPath:indexPath];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}

@end
