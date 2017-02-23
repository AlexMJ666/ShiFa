//
//  LocationViewController.m
//  MJLocationCity
//
//  Created by 马家俊 on 16/6/7.
//  Copyright © 2016年 MJ. All rights reserved.
//

#import "LocationViewController.h"
#import "CityView.h"
@interface LocationViewController ()<CityTableViewDelegate>
{
    CityView* m_cityView;
}
@property(nonnull,strong) IBOutlet CityView* p_cityView;
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_cityView.p_CityTableViewDelegate = self;
    [self.p_cityView refreshTableView];
    // Do any additional setup after loading the view.
}

-(void)cityTouch:(NSString *)cityName
{
    //此页面已经存在于self.navigationController.viewControllers中,并且是当前页面的前一页面
    HomeViewController *VC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    //初始化其属性
    VC.locationCity = nil;
    //传递参数过去
    VC.locationCity = cityName;
    //使用popToViewController返回并传值到上一页面
    [self.navigationController popToViewController:VC animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
