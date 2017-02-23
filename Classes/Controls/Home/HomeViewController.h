//
//  HomeViewController.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

@import UIKit;
#import "HomeView.h"
@interface HomeViewController : UIViewController
{
    HomeView* m_homeView;
}
@property (nonatomic, strong) IBOutlet HomeView *p_homeView;
@property (nonatomic, strong) NSString* locationCity;
@end
