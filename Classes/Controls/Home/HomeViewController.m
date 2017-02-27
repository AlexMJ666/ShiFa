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
@property(nonatomic,strong) UIButton* leftBtn;
@property(nonatomic,strong) UIButton* rightBtn;
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
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn], nil];

    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn], nil];
}

-(UIButton*)leftBtn
{
    if (!_leftBtn) {
        self.locationCity = @"杭州";
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, 0, 44, 44);
        [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        _leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_leftBtn addTarget:self action:@selector(leftBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBtn setImage:[UIImage imageNamed:@"btn_location"] forState:UIControlStateNormal];
        _leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //_leftBtn.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
        [_leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(_leftBtn.imageView.frame.size.height ,-_leftBtn.imageView.frame.size.width, 0.0,0.0)];
        [_leftBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 10.0,0.0, -_leftBtn.titleLabel.bounds.size.width)];
    }
    return _leftBtn;
}

-(UIButton*)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 44, 44);
        [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        _rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rightBtn addTarget:self action:@selector(rightBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setTitle:@"购物车" forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"btn_cart"] forState:UIControlStateNormal];
        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //_leftBtn.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
        [_rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(_rightBtn.imageView.frame.size.height+10 ,-_rightBtn.imageView.frame.size.width+5, 0.0,0.0)];
        [_rightBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 10.0,0.0, -_rightBtn.titleLabel.bounds.size.width)];
    }
    return _rightBtn;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_leftBtn setTitle:self.locationCity forState:UIControlStateNormal];
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

-(void)leftBtnTouch:(id)sender
{
    [self performSegueWithIdentifier:@"locationVCShow" sender:nil];
}

-(void)rightBtnTouch:(id)sender
{}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
