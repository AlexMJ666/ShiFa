//
//  SearchViewController.m
//  ShiFa
//
//  Created by 马家俊 on 17/2/27.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
@interface SearchViewController ()
{
    SearchView* searchView;
}
@property(nonatomic,strong) IBOutlet SearchView* searchView;
@property(nonatomic,strong) UIButton* rightBtn;
@end

@implementation SearchViewController
@synthesize searchView;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *negativeSpacerR = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacerR.width = -10;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacerR, [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn], nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
