//
//  HomeViewController.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<HomeViewDelegate>
@property(nonatomic,strong) NSMutableDictionary* dateMutiDic;
@end

@implementation HomeViewController
@synthesize p_homeView = m_homeView;

-(void)dateArr
{
    self.dateMutiDic = [NSMutableDictionary new];
    NSArray* imageArr = [NSArray arrayWithObjects:
                         @"http://nyato.com/data/upload/image/20161223/1482459928320070.jpg",
                         @"http://imgsrc.baidu.com/forum/w%3D580/sign=a01f2024359b033b2c88fcd225ce3620/c15893cd7b899e517b86073443a7d933c8950d2c.jpg",
                         @"http://img4.duitang.com/uploads/item/201411/20/20141120224050_UZudN.thumb.700_0.jpeg",
                         @"http://i0.hdslb.com/video/bb/bbc5795cb817c994a474152060f90b5c.jpg", nil];
    
    
    [CommonDeal setSafetyObject:imageArr forKey:@"adImagesArr" andDic:self.dateMutiDic];
    
    NSArray* itemArr = [NSArray arrayWithObjects:@"汽机油",@"蓄电池",@"轮胎",@"更多",nil];
    [CommonDeal setSafetyObject:itemArr forKey:@"itemNamesArr" andDic:self.dateMutiDic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dateArr];
    self.p_homeView.p_homeViewDelegate = self;
    [self.p_homeView refreshHomeView:self.dateMutiDic];
    // Do any additional setup after loading the view.
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
