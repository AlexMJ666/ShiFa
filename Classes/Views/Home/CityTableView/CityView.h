//
//  CityView.h
//  MJLocationCity
//
//  Created by 马家俊 on 16/6/28.
//  Copyright © 2016年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CityTableViewDelegate <NSObject>
-(void)cityTouch:(NSString*)cityName;
@end
@interface CityView : UIView
{
    __weak id<CityTableViewDelegate> m_CityTableViewDelegate;
    UITableView* m_tableView;
}
@property (nonatomic, weak) id<CityTableViewDelegate> p_CityTableViewDelegate;

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSMutableArray *provience;
@property (nonatomic, strong) IBOutlet UITableView* p_tableView;

-(void)refreshTableView;
@end
