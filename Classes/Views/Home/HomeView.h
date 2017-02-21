//
//  HomeView.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeViewDelegate <NSObject>

@end
@interface HomeView : UIView
{
    __weak id<HomeViewDelegate> m_homeViewDelegate;
}
@property (nonatomic, weak) id<HomeViewDelegate> p_homeViewDelegate;
-(void)refreshHomeView:(NSDictionary *)dateDic;
@end
