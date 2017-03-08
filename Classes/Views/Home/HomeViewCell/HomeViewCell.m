//
//  HomeViewCell.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeViewCell.h"
#import <objc/runtime.h>
@interface HomeViewCell()<ImageSliderViewDelegate>

@end
@implementation HomeViewCell
@synthesize homeColloctionView;
@synthesize img;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//
//    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//        if (hitTestView) {
//            return hitTestView;
//        }
//    }
//    return self;
//
//}
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    for (UIView* view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]])
        {
            return [view hitTest:point withEvent:event];
        }
        
    }
    return self;
}

-(void)addDifferentCellWFromSection:(NSInteger)section andCell:(UITableViewCell*)cell andDate:(NSDictionary *)dic
{
    
    HomeModel* model = [[HomeModel alloc]parseFromDic:dic];
    
    if (section == 0) {
        ImageSliderView* slideView = [[ImageSliderView alloc] initWithFrame:CGRectMake(0, 0, kMainScreen_Width,kImageH)];
        slideView.p_ImageSliderViewDelegate = self;
        [slideView refreshCycleImages:model.m_adImagesArr];
        [cell.contentView addSubview:slideView];
    }else if (section == 1)
    {
        [homeColloctionView refreshColloction:model.m_itemNamesArr];
    }else
    {
        [img sd_setImageWithURL:[NSURL URLWithString:@"http://i0.hdslb.com/video/bb/bbc5795cb817c994a474152060f90b5c.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
    }
}

-(void)slideClickIndexAtRow:(NSInteger)index
{}
@end
