//
//  HomeViewCell.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageSliderView.h"
#import "HomeColloctionView.h"
#import "HomeModel.h"
#define kImageH                 kMainScreen_Width*9/16      //图片高度
@interface HomeViewCell : UITableViewCell
-(void)addDifferentCellWFromSection:(NSInteger)section andCell:(UITableViewCell*)cell andDate:(NSDictionary*)dic;
@end