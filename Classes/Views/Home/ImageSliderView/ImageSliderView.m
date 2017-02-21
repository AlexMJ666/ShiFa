//
//  ImageSliderView.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "ImageSliderView.h"
#import <SDCycleScrollView.h>

@interface ImageSliderView ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *cycleView;
@end
@implementation ImageSliderView
@synthesize p_ImageSliderViewDelegate = m_ImageSliderViewDelegate;
-(void)dealloc
{}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
        _cycleView.autoScrollTimeInterval = 3;
        _cycleView.backgroundColor = rgb255(241, 241, 241, 1.0f);
        _cycleView.delegate = self;
        _cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _cycleView.currentPageDotColor = [UIColor whiteColor];
        _cycleView.pageDotColor = [UIColor colorWithWhite:1 alpha:0.56f];
        [self addSubview:_cycleView];
    }
    return self;
}

-(void)refreshCycleImages:(NSMutableArray *)imgArray{
    _cycleView.imageURLStringsGroup = [NSArray arrayWithArray:imgArray];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (m_ImageSliderViewDelegate && [m_ImageSliderViewDelegate respondsToSelector:@selector(slideClickIndexAtRow:)]) {
        [m_ImageSliderViewDelegate slideClickIndexAtRow:index];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
