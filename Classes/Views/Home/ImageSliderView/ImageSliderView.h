//
//  ImageSliderView.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageSliderViewDelegate <NSObject>
-(void)slideClickIndexAtRow:(NSInteger)index;
@end
@interface ImageSliderView : UIView
{
    __weak id<ImageSliderViewDelegate> m_ImageSliderViewDelegate;
}
@property(nonatomic,weak) id<ImageSliderViewDelegate> p_ImageSliderViewDelegate;
-(void)refreshCycleImages:(NSMutableArray *)imgArray;
@end
